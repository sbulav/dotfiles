# Prerequisites https://gist.github.com/dergachev/4627207
function mov2gif --description "convert mov to gif"
  set out out.gif
  ffmpeg -i $argv -vf "scale=min(iw\,1024):-1" -r "20" -sws_flags lanczos -f image2pipe -vcodec ppm - \
    | convert -delay 5 -layers Optimize -loop 0 - "$out";
end
