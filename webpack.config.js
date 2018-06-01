const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: './src/main.js',
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'public/')
  },
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.tag$/,
        exclude: /node_modules/,
        loader: 'riot-tag-loader'
      },
      {
        test: /\.(tag|js)$/,
        exclude: /node_modules/,
        loader: 'buble-loader',
        options: {
          target: { ie: 10 }
        }
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          { loader: 'css-loader', options: { url: false } },
        ]
      }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot',
      jQuery: 'jquery',
      $: 'jquery',
      'window.jQuery': 'jquery'
    })
  ],
  devServer: {
    contentBase: './public',
    port: 3000
  },
};
