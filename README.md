- bundle install
- rails s

- open a browser on localhost:3000
- load up a game and copy the url, ie: (localhost:3000/games/1)
- paste that in a separate browser


Here's what was practised:

Turbo Frames:
     Wrapped the board in turbo_frame_tag game, so form submissions scoped to it could update just that piece of the page. Also tried lazy-loading (src: on a frame) to defer a fetch until the frame hits the DOM.

Turbo Streams over Action Cable (broadcasts_to):
     Moved sync from "just the tab that clicked" to "every tab watching," by having the Game/Move models broadcast the same kind of targeted replace/append over a WebSocket stream (turbo_stream_from @game subscribing on the other end). This is what made it real-time multiplayer.

Custom Turbo Stream actions:
     Turbo only ships 7 built-in actions (replace, append, etc.), so for "trigger confetti" - something with no DOM target at all - so invented my own (Turbo.StreamActions.celebrate) and had the server fire it as its own dedicated signal.

Turbo 8 morphing (broadcasts_refreshes_to):
     Swapped precision for simplicity: instead of the server saying exactly what changed, it just says "something changed," and the client re-fetches the page and diffs it. Way less Rails code, at the cost of an extra HTTP round-trip and losing some fine control (like when Stimulus's connect() does or doesn't re-fire).

Stimulus:
     Two small controllers: one that pops the last-played cell into view on connect(), and one that launches the confetti burst when it hears the celebrate signal. Showed how JS behavior keeps working automatically across both Stream-driven and morph-driven updates without any manual re-initialization.
