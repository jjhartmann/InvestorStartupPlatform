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
    './app/bundles/FrontEndPages/startup/Test1',
    './app/bundles/FrontEndPages/startup/Test2',
    './app/bundles/FrontEndPages/startup/Test',
    // #About
    './app/bundles/FrontEndPages/startup/AboutApp',
    // #Video
    './app/bundles/FrontEndPages/startup/VideoSection',
    // #Benefits
    './app/bundles/FrontEndPages/startup/BenefitsSection',
    // #Charts
    './app/bundles/FrontEndPages/startup/ChartSection',

    //include javascripts
    './javascripts/jquery.min',
    './javascripts/bootstrap.min',
    './javascripts/agency',
    './javascripts/chart',
    './javascripts/rails_admin/ui',
  ],

  output: {
    filename: 'webpack-bundle.js',
    path: '../app/assets/webpack',
  },

  resolve: {
    extensions: ['', '.js', '.jsx'],
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
