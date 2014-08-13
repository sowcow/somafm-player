# soma-atom

soma fm radio player using html5

`<do I need screens when just link can do it?>`

## how it builds

[Rakefile + rakedir - all the code]

`rake`

http://soma.fm -------> public/images/...
        |
        \---> channels.yml --\
                              =----> public/index.html
main.slim -------------------/


## decisions

- no current track polling - just on hover through android api
- IHover.css is cool
- opal.rb too

# what is not used

- unfortunately didn't found a way to play mp3 stream in atom-shell
- here ember would be overhead,
  when it can be just one file app with one main scene

# unknowns

- may be later as a gem that just opens local page?
  anyway radio is remote... so git pages should do the thing
  of distribution

- to inline stations images so app is one file?
  I guess no - cuz if it uses git pages and anyway is remote-dependent
  as radio player, it can has any strucutre...
