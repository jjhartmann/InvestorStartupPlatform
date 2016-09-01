const webpack = require('webpack');
const path = require('path');

const devBuild = process.env.NODE_ENV !== 'production';
const nodeEnv = devBuild ? 'development' : 'production';

config = {
  entry: [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'babel-polyfill',
    //Include all the entry points
    './app/bundles/HelloWorld/startup/HelloWorldApp',
    // #Header of the main page.
    './app/bundles/FrontEndPages/startup/FrontPageHeaderApp',
    // #Footer of the main page.
    './app/bundles/FrontEndPages/startup/FrontPageFooterApp',
    // #FAQ
    './app/bundles/FrontEndPages/startup/FAQ',
    // #Contact Info
    './app/bundles/FrontEndPages/startup/ContactInfo',
    // #About
    './app/bundles/FrontEndPages/startup/AboutApp',
    // #Services
    './app/bundles/FrontEndPages/startup/Services',
    //include javascripts
    './javascripts/jquery.min',
    './javascripts/bootstrap.min',
    './javascripts/agency',
    './javascripts/chart',
    './javascripts/rails_admin/ui',

    //include stylesheets
    './stylesheets/bootstrap.min',
    './stylesheets/agency',
    './stylesheets/font-awesome.min',
  ],

  output: {
    filename: 'webpack-bundle.js',
    path: '../app/assets/webpack',
  },

  resolve: {
    extensions: ['', '.js', '.jsx','.css'],
    alias: {
      react: path.resolve('./node_modules/react'),
      'react-dom': path.resolve('./node_modules/react-dom'),
    },
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv),
      },
    }),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery"
    }),
  ],
  module: {
    loaders: [
      {
        test: require.resolve('react'),
        loader: 'imports?shim=es5-shim/es5-shim&sham=es5-shim/es5-sham',
      },
      {
        test: /\.jsx?$/, loader: 'babel-loader',
        exclude: /node_modules/,
      },
      { test: /\.css$/, loader: "style-loader!css-loader" }
    ],
  },
};

module.exports = config;

if (devBuild) {
  console.log('Webpack dev build for Rails'); // eslint-disable-line no-console
  module.exports.devtool = 'eval-source-map';
} else {
  config.plugins.push(
    new webpack.optimize.DedupePlugin()
  );
  console.log('Webpack production build for Rails'); // eslint-disable-line no-console
}
