Listener
========

Listener is a shell script for linux that serves to monitor file and apply commands at runtime.


Author
======

Marcos Garcia [Marcker](https://github.com/marcker)


Dependency
==========

* [inotify-tools](https://github.com/rvoicilas/inotify-tools)

Install in Debian/Ubuntu with APT:

`sudo apt-get install inotify-tools`

Basic usage
===========

`./listener.sh inputfile "commmands"`


###Basic example:

$ `coffee -bcw scripts.coffee scripts.js`

<pre>
    INPUT                           OUTPUT
  scripts.coffe | CoffeScript    | scripts.js |
                | compiles to JS |
</pre>

$ `./listener.sh scripts.js "yuicompressor scripts.js -o scripts.min.js"`

<pre>
    INPUT                          OUTPUT
  scripts.js | listener.sh     | scripts.min.js
             | + yuicompressor |
</pre>

Then when saving the `scripts.coffe`, `scripts.min.js` is updated \o/.

###Video:
http://www.youtube.com/watch?v=-shCQJYdVKo


License
=======

GNU General Public License
http://www.gnu.org/licenses/gpl.html