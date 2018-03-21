const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: './src/main.js',
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'public/javascripts')
  },
  mode: 'development',//mode 'production'
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.tag$/,
        exclude: /node_modules/,
        use: [{
          loader: 'riotjs-loader',
          options: {
            type: 'none'
          }
        }],
      },
      {
        test: /\.(tag|js)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['es2015-riot']
        }
      }
    ]
  },
  devtool: 'source-map',
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    })
  ]
};
