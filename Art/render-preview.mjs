import { readFileSync, writeFileSync, mkdirSync } from 'node:fs';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { dirname, resolve } from 'node:path';
import { spawnSync } from 'node:child_process';

const art = dirname(fileURLToPath(import.meta.url));
const root = resolve(art, '..');
const palette = JSON.parse(readFileSync(resolve(art, 'preview-palette.json'), 'utf8'));
const veilRgb = palette.veil.match(/[a-f0-9]{2}/gi).map(value => parseInt(value, 16)).join(',');
const variables = Object.entries(palette).map(([key, value]) => `--${key}:${value}`).join(';');
const background = readFileSync(resolve(art, 'Preview.png')).toString('base64');
const html = `<!doctype html><meta charset="utf-8"><title>Mengwu Preview</title>
<style>
:root{${variables}}
*{box-sizing:border-box}html,body{margin:0;width:896px;height:504px;overflow:hidden}
body{font-family:"Segoe UI",system-ui,sans-serif;background:var(--veil);color:var(--inkPrimary)}
.art,.veil{position:absolute;inset:0}.art{background:url(data:image/png;base64,${background}) center/cover}
.veil{background:linear-gradient(90deg,rgba(${veilRgb},.96) 0%,rgba(${veilRgb},.94) 47%,rgba(${veilRgb},.40) 62%,transparent 78%)}
.copy{position:absolute;left:50px;top:54px;width:505px;text-shadow:0 3px 10px rgba(0,0,0,.75)}
h1,p{margin:0}h1{font-size:46px;font-weight:600;line-height:1.1;letter-spacing:0}
.suffix{font-size:.65em;color:var(--inkSecondary)}
.tag{margin-top:8px;font-size:24px;font-weight:400;line-height:1.1;letter-spacing:.2px;color:var(--inkSecondary)}
.line{width:58px;height:3px;background:var(--accent);margin-top:20px;margin-bottom:16px}
p{font-size:21px;font-weight:400;line-height:1.45;width:430px}
.badge{position:absolute;right:0;top:0;width:80px;height:80px;background:var(--accent);clip-path:polygon(0 0,100% 0,100% 100%)}
.version{position:absolute;left:869px;top:27px;transform:translate(-50%,-50%) rotate(45deg);font-size:26px;font-weight:700;line-height:1;color:var(--badgeInk)}
.background-only .copy,.background-only .version{visibility:hidden}
</style><div class="art"></div><div class="veil"></div>
<div class="copy"><h1>Mengwu Expanded -<br>Animals <span class="suffix">Renew</span></h1><div class="tag">(unofficial)</div><div class="line"></div><p>A steppe horse and three small<br>companions for your colony.</p></div>
<div class="badge"></div><div class="version">1.6</div>
<script>if(location.hash==='#background')document.body.classList.add('background-only');document.fonts.ready.then(()=>document.documentElement.dataset.fontsReady='true');</script>`;
writeFileSync(resolve(art, 'preview.html'), html);
const profile = resolve(root, '.build', 'preview-chrome');
mkdirSync(profile, { recursive: true });
for (const [name, hash] of [['../Mod/About/Preview.png', ''], ['Preview-background-check.png', '#background']]) {
  const result = spawnSync('C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe', [
    '--headless', '--disable-gpu', '--no-first-run', '--no-default-browser-check',
    `--user-data-dir=${profile}`, '--hide-scrollbars', '--force-device-scale-factor=1',
    '--window-size=896,504', '--virtual-time-budget=2500',
    `--screenshot=${resolve(art, name)}`, pathToFileURL(resolve(art, 'preview.html')).href + hash
  ], { encoding: 'utf8', windowsHide: true, timeout: 30000 });
  if (result.status !== 0) throw new Error(result.stderr || String(result.error));
  console.log(`Rendered ${name}`);
}
