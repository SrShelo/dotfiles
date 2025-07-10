# Qutebrowser settings

> **Note:** I don't touch config.py directly, I just edit utils.py and then I import it into config.py.

## Updating QuteBrowser
If you update QuteBrowser maybe you'll want to rewrite config.py file. So to initilize the configuration again you have to put the following line into config.py
```python
config.source('settings/utils.py')
```
and set
```python
config.load_autoconfig(True)
```
And all it's done.
