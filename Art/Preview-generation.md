# Preview illustration

Generated on 2026-09-13 with the built-in image_gen tool. The four shipped south-facing
animal textures were supplied as species, colour and silhouette references. Generated
source copied to Art/Preview.png; final HTML composition is installed in Mod/About/Preview.png.

## Prompt

Create a landscape 16:9 RimWorld mod Workshop illustration WITHOUT ANY TEXT. Four animals only, modeled on the four reference sprites (reference art for species, colour and silhouette, not edit targets): one stocky dark reddish-brown Mongolian horse with dark mane, one tiny sandy-orange jerboa with long thin tufted tail and small pointed ears, one squat grey-brown Pallas's cat with broad flat face and rounded ears, one stout tan groundhog. All exactly once. Scene: a small steppe colony animal yard on olive sage grass and compacted square patches of earth, short worn timber fence across upper right, a hay bundle and a single low warm lamp beside the fence. The horse wears a simple faded teal saddle blanket and stands on the RIGHT side, oriented diagonally down-left. The three distinct small animals form a loose triangle in the lower-right yard, with visible gaps and believable size differences; Pallas cat larger than jerboa. Leave the LEFT 50 percent as very calm olive ground with subtle tile rhythm and no subjects, for later title overlay. No humans. Camera high oblique overhead 65-70 degrees above horizon, near orthographic exactly like RimWorld: ground fills entire frame, see animals mostly from above, no horizon, sky or vanishing point. Matte gouache-like game illustration, low texture detail, simple functional slightly worn shapes, soft edges and dark contact shadows, not realistic fur. Dominant olive/sage family across the yard, warm brown horse/wood and small warm lamp pool, a distinct teal blanket accent. Strong clear separated silhouettes, readable at 268 pixels wide. Absolutely no text, letters, numbers, logo, watermark, UI, border, letterboxing, sparkles, lens flare, dramatic landscape, anime, Ghibli, Disney, cartoon mascot, 3D render or isometric diorama. No extra animals.

## Composition

Run `node Art/render-preview.mjs` from the repository root. Requires installed Google Chrome
and Segoe UI. The script generates preview.html from preview-palette.json and embeds the
illustration. Chrome uses a dedicated .build profile, a 896 x 504 viewport and a font-ready
marker with a 2500 ms virtual-time budget. The background-only rendering supports contrast QA.

The olive ground anchors the veil and pale olive secondary ink; the horse's teal blanket
anchors the brighter turquoise accent. The title preserves the current About name; Renew
is reduced to 65 percent and uses secondary ink. The metadata now includes (unofficial), displayed as a separate 24 px secondary-colour tag.

## ModIcon cutout, bottom-left corner (owner's rule, 2026-09-29)

`Art/ModIcon-cutout.png` is `Art/ModIcon-textless.png` (the full-resolution source, not the
delivered 128x128) with its near-black background flood-filled transparent from the border
inward, so the horse's own near-black outline — which never touches the frame — is untouched.
No global colour threshold: a global cutoff would also punch through the outline. Produced
once, by hand, with a PowerShell/System.Drawing flood fill (this repository has no Node/sharp
setup); re-run only if the icon source changes. `render-preview.mjs` embeds it as `.icon` in
`preview.html`, bottom-left corner, tilted `+15deg` per the owner's rule (left corner = `+15deg`,
right corner = `-15deg`), bleeding slightly off the left/bottom edges. It sits below the copy
block (copy ends around y=300, the icon starts at y=329 of the 504px canvas): no overlap check
beyond that visual margin was automated.

Also fixed the same day: `render-preview.mjs`'s Chrome screenshot call threw on a successful
run, because headless Chrome writes `N bytes written to file ...` to stderr and exits non-zero
even on success; the script now treats that stderr line as success too.
