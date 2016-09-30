const webpack = require('webpack');
const path = require('path');

const devBuild = process.env.NODE_ENV !== 'production';
const nodeEnv = devBuild ? 'development' : 'production';

config = {
  entry:{
    'webpack-bundle':[
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'jquery-ujs',
    'babel-polyfill',
    //Include all the entry points
    './app/bundles/HelloWorld/startup/HelloWorldApp',
    './app/bundles/FrontEndPages/startup/Home',
    // #Header of the main page.
    './app/bundles/FrontEndPages/startup/FrontPageHeaderApp',
    // #Profile Page of the user
    './app/bundles/FrontEndPages/startup/Profile',
    // #Header of user after sigin in
    './app/bundles/FrontEndPages/startup/UserFrontPageHeader',
    // #Footer of the main page.
    './app/bundles/FrontEndPages/startup/FrontPageFooterApp',
    './app/bundles/FrontEndPages/startup/Profile',
    // #FAQ
    './app/bundles/FrontEndPages/startup/FAQ',
    // #Contact Info
    './app/bundles/FrontEndPages/startup/ContactInfo',
    // #About
    './app/bundles/FrontEndPages/startup/AboutApp',
    // #Services
    './app/bundles/FrontEndPages/startup/Services',
    // #Login
    './app/bundles/FrontEndPages/startup/Login',
    // Register
    './app/bundles/FrontEndPages/startup/RegisterApp',
    // Alerts in header
    './app/bundles/FrontEndPages/startup/Alert',
    // Questionaire in header
    './app/bundles/FrontEndPages/startup/Questionaire',
    //include javascripts
    './javascripts/jquery.min',
    './javascripts/bootstrap.min',
    './javascripts/agency',
    './javascripts/dashboard',
    './javascripts/all_users',
    './javascripts/connections',
    // './javascripts/jquery.mCustomScrollbar.concat.min',

    //include stylesheets
    './stylesheets/bootstrap.min',
    './stylesheets/agency',
    './stylesheets/font-awesome.min',
    './stylesheets/style',
    './stylesheets/responsive',
    // './stylesheets/jquery.mCustomScrollbar.min'
  ],
  RailsAdminBundle: [
    './javascripts/rails_admin/ra.widgets',
    './javascripts/rails_admin/custom/ui',
  ],
  },

  output: {
    filename: '[name].js',
    path: '../app/assets/webpack',
    publicPath: '../public',
  },

  resolve: {
    extensions: ['', '.js', '.jsx','.css', '.coffee', 'woff', 'ttf', 'eot', 'svg' ],
    alias: {
      react: path.resolve('./node_modules/react'),
      'react-dom': path.resolve('./node_modules/react-dom'),

      // JQUERY-UI
      "jquery-ui": "jquery-ui/jquery-ui.js",
      modules: [
        path.join(__dirname, "node_modules"),
        path.join(__dirname, "javascripts"),
        path.join(__dirname, "stylesheets"),
      ]
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
      jQuery: "jquery",
      "window.jQuery": "jquery",
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
        exclude: [/node_modules/, /javascripts/,],
      },
      { test: /\.css$/, loader: "style-loader!css-loader" },

      // Cofee Loaders
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" },

      // Font Awesome Loaders
      { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&minetype=application/font-woff" },
      { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" },

      // Jquery-UI
      { test: /\.(jpe?g|png|gif)$/i, loader:"file" },

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
