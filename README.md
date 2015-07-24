# ac-html-bootstrap.el #

bootstrap3/fontawesome completion data for EMACS `ac-html` and `company-web` modes.

## DESCRIPTION ##

If  you  ok   that  `glyphicon`  classes  allowed  only   for  `<i>`  or
`label-default` for `<span>`, `<label>` and so  on, this package may be good for you.
Alternative you  can use  package [ac-html-csswatcher](https://github.com/osv/ac-html-csswatcher/) that  parse all
css in project.

However  this  package  provide   documentation  with  samples  and
additional data-  attributes that `ac-html-csswatcher`  can't provide,
so `ac-html-bootstrap` may be helpful for you.

## SETUP

Install `ac-html` if you use `auto-complete` completion framework
or `company-web` if you are using `company` framework.

When you edit your .html(.jade, etc) file exec `M-x ac-html-bootstrap+`
or `M-x company-web-bootstrap+' to enable twitter bootstrap completion.
If you want Font Awesome: `M-x ac-html-fa+` or `M-x company-web-fa+`

Note: Font Awesome completion only available for <i> tag

## CONTRIBUTE ##

All definition are in `bootstrap.yaml`.
Build script here: https://github.com/osv/h5doc.git

Font awesome completion are genereated automatically by script `font-awesome.pl` from css.
