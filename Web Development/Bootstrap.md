
#### Installing Bootstrap

```bash
npm init

npm install --save bootstrap
```

- This should install a node_module dependency with all of the bootstrap in it

#### Custom Bootstrap

Making the custom bootstrap file
```bash
mkdir scss

cd scss/

touch custom.scss
```


##### Colors

Basic example of making your own color
```scss
@import "node_modules/bootstrap/scss/functions";
@import "node_modules/bootstrap/scss/variables";

// Negative Margins
$enable-negative-margins: true

// Custom Colors
$custom-colors :(
  "custom-color":#000000
);

$theme-colors: map-merge($theme-colors, $custom-colors);

@import "node_modules/bootstrap/scss/bootstrap";
```

Basic example of overriding default bootstrap colors
```scss
//Default Bootstrap Colors
$primary: #000000;
$secondary: #000000;
$danger: #000000;

@import "node_modules/bootstrap/scss/bootstrap";
```


### Compile custom scss

```css
sass custom.scss:custom.css
```
- sass is the program
- custom.scss is the input file
- custom.css is the output file


```css
sass --watch custom.scss:custom.min.css --style compressed
```
- sass is the program
- custom.scss is the input file
- custom.min.css is the minified css output file
- "--style compressed" is the modifier to make it compressed


#### Automatic Compiling

##### Intellij File Watchers

Arguments
```
$FileName$:$FileNameWithoutExtension$.css
$FileName$:$FileNameWithoutExtension$.min.css --style compressed
```

Output paths to refresh
```
$FileNameWithoutExtension$.css:$FileNameWithoutExtension$.css.map
$FileNameWithoutExtension$.min.css
```

Working Directory
```
$FileDir$
```

- 1st one is for producing the custom-bootstrap.css file
- 2nd one is for producing the custom-bottstrap.min.css file
	- This one doesn't have all the formatting and whitespace which the regular one has. This because it doesn't have to be readable by a human, just a computer, so this way the files are shorter and easier to upload to websites

##### Native

```shell
sass --watch ./scss/bootstrap.scss ./css/bootstrap.css
sass --watch ./scss/bootstrap.scss ./css/bootstrap.min.css
```


## Templates

Negative Margins
```bash
$enable-negative-margins: true
```

Custom Colors
```bash
$custom-colors :(
  "custom-color":#000000
);

$theme-colors: map-merge($theme-colors, $custom-colors);
```
