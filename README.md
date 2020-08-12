# text-based-web-browser-comparison

This is the code that powers [this blog post](https://www.xkyle.com/A-Comparison-of-Text-Based-Web-Browsers/)
comparing how different pages look under different text-based browsers.

## List of Browsers Compared

* [retawq](http://retawq.sourceforge.net/)
* [elinks](http://elinks.or.cz/)
* [links2](http://links.twibright.com/)
* [w3m](http://w3m.sourceforge.net/)
* [lynx](http://lynx.browser.org/)

## Browsers not compared

* [Netrik](http://netrik.sourceforge.net/) (no https support)

## Config Options Used

* retawq
    * Enable SSL support
* lynx
    * Always allow cookies
* elinks
    * underline
    * linux frames
    * 256 color
    * utf8
* links2
    * Linux frames
    * Color
* w3m
    * Render frames

### Launch xterms and take Screenshots

    make screenshots

## Results

Final results are published on my [blog](http://xkyle.com/a-comparison-of-text-based-web-browsers/)

## Related Work 

* [Kmandla comparison](https://kmandla.wordpress.com/2011/01/13/a-comparison-of-text-based-browsers/)
* [2005 Text Mode Browser Roundup](http://www.linuxjournal.com/article/8148)
* [The history and evolution of the Links browsers](http://elinks.cz/history.html)
