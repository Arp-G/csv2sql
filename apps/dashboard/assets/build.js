// Custom Javascript build script to use esbuild plugins with phoenix

const esbuild = require('esbuild');
const postcss = require('postcss');
const { sassPlugin } = require("esbuild-sass-plugin");
const autoprefixer = require('autoprefixer');

const args = process.argv.slice(2)
const watch = args.includes('--watch')
const deploy = args.includes('--deploy')

const loader = {
  // Add loaders for images/fonts/etc, e.g. { '.svg': 'file' }
}

const plugins = [
  // Add and configure plugins here
  sassPlugin()
]

let opts = {
  entryPoints: ['js/app.js'],
  bundle: true,
  target: 'es2016',
  outdir: '../priv/static/assets',
  logLevel: 'info',
  loader,
  plugins
}

if (watch) {
  opts = {
    ...opts,
    watch,
    sourcemap: 'inline'
  }
}

if (deploy) {
  opts = {
    ...opts,
    minify: true
  }
}

const promise = esbuild.build(opts)

if (watch) {
  promise.then(_result => {
    process.stdin.on('close', () => {
      process.exit(0)
    })

    process.stdin.resume()
  })
}
