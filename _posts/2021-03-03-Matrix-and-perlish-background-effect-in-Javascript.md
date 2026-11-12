---
layout: post
title: Matrix (and perlish) background effect in Javascript :)
date: 2021-03-03 14:14:42
---
Today I have something *useless-but-cool* to show. 

![Perl Matrix](/assets/images/mtrx.png)

My **Matrix-perlish background**!

![Perl Matrix](/assets/images/1gu4w7s5mytelczi5l1v.gif)

Check out my github page to see a [live preview](https://thibaultduponchelle.github.io/wawawa/pmtrx/)

It's only a couple of lines of javascript derivated from the work that you can find [here](https://codepen.io/P3R0/pen/MwgoKv) or [here](https://codepen.io/wefiy/pen/WPpEwo) so I deserve absolutely zero credit but I simply modified it to make it appear *more perlish*! :+1:

(or ***p@r]i$%*** if you prefer)



Below the full code:
```html
<html>
  <head>
  </head>
  <body>
    <!-- background animations -->
    <div class="div_bg">
      <canvas id="c"></canvas>
    </div>
    <script>
      var c = document.getElementById("c");
      var ctx = c.getContext("2d");
      c.height = window.innerHeight;
      c.width = window.innerWidth;
      var txts = "~!@#$%^&*)(_-=+;:{}[]|\/<>,.";
      txts = txts.split("");
      var font_size = 12;
      var columns = c.width / font_size;
      var drops = [];
      for (var x = 0; x < columns; x++) drops[x] = 1;
    
      function draw() {
        ctx.fillStyle = "rgba(255, 255, 255, 0.05)";
        ctx.fillRect(0, 0, c.width, c.height);
        ctx.fillStyle = "#000";
        ctx.font = font_size + "px arial";
        for (var i = 0; i < drops.length; i++) {
          var text = txts[Math.floor(Math.random() * txts.length)];
          ctx.fillText(text, i * font_size, drops[i] * font_size);
          if (drops[i] * font_size > c.height || Math.random() > 0.98) drops[i] = 0;
          drops[i]++;
        }
      }
      setInterval(draw, 20);
    </script>
  </body>
</html>
```

