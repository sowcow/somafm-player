# soma-fm player

soma-fm radio player using html5

## how it builds

`rake full_update` # invokes task from bags/

```
http://soma.fm -------> public/images/...
        |
        \---> channels.yml --\
                              =----> public/index.html
template --------------------/
```


## todo

- :white_check_mark: plays soma fm
- :white_check_mark: opal.rb
- :white_circle: no current-track polling - just on hover through android api
- :white_circle: IHover.css

## not todo

- atom-shell
- ember
- gem
