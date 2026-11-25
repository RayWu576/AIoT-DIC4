param([string]$Version)
$ErrorActionPreference='Stop'
$d=Join-Path $env:TEMP 'dic4-build-tools'
$env:PYTHONPATH="$d/pdfreader"
$env:PYTHONIOENCODING='utf-8'
@'
import pathlib, sys, re, zipfile, hashlib, os
import pymupdf
from PIL import Image
v=sys.argv[1]
tag, variant = ('V1','Initial') if v=='v1-initial' else ('V2','Revised')
folder=pathlib.Path('paper')/v
output=pathlib.Path('deliverables')
output.mkdir(exist_ok=True)
pdf=output/f'DIC4_Conference_{tag}_{variant}.pdf'
log=(folder/'main.log').read_text(encoding='utf-8', errors='replace')
last=log.split('This is XeTeX')[-1]
assert not re.search(r'undefined references|Citation.+undefined|Reference.+undefined|Overfull',last,re.I)
raw=(folder/'main.pdf').read_bytes()
doc=pymupdf.open(stream=raw)
txt=' '.join(' '.join(p.get_text().split()) for p in doc)
for marker in ('18.28%', '19.71%', 'Introduction', 'Related Work', 'Proposed Scheme', 'Experimental Evaluation', 'Conclusion', 'REFERENCES'):
    assert marker.lower() in txt.lower(), marker
assert not re.search(r'[\u3400-\u9fff]|\[\?\]',txt)
for i in range(1,7):
    assert f'[{i}]' in txt, i
assert all(f"fig. {i}" in txt.lower() for i in range(1,4)), txt
for p in doc:
    assert abs(p.rect.width-612)<2 and abs(p.rect.height-792)<2
    for b in p.get_text('blocks'):
        assert b[0]>=30 and b[2]<=582 and 20<=b[1]<=b[3]<=770, b
qa=pathlib.Path(os.environ['TEMP'])/'dic4-build-tools'
sheet=Image.new('RGB',(min(len(doc),3)*510,((len(doc)+2)//3)*660),'white')
for i,p in enumerate(doc):
    pix=p.get_pixmap(matrix=pymupdf.Matrix(5/6,5/6),alpha=False)
    sheet.paste(Image.frombytes('RGB',(pix.width,pix.height),pix.samples),((i%3)*510,(i//3)*660))
sheet.save(qa/f'{tag}-pages.png')
sources=[p for p in sorted(folder.rglob('*')) if p.suffix in ('.tex','.bib') and p.is_file()]
assert len(sources)==12, len(sources)
zip_path=output/f'Overleaf_{tag}.zip'
for file in (pdf,zip_path):
    assert not file.exists(), f'Preserved output already exists: {file}'
pdf.write_bytes(raw)
with zipfile.ZipFile(zip_path,'w',zipfile.ZIP_DEFLATED) as z:
    for p in sources:
        z.write(p,p.relative_to(folder).as_posix())
with zipfile.ZipFile(zip_path) as z:
    assert z.testzip() is None and 'main.tex' in z.namelist()
    assert all(z.read(p.relative_to(folder).as_posix())==p.read_bytes() for p in sources)
print(f'{tag}: {len(doc)} pages, six citations, 12 source files, PDF SHA-256 {hashlib.sha256(raw).hexdigest()}')
'@ | python - $Version
exit $LASTEXITCODE
