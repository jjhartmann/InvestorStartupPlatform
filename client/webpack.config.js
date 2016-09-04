const webpack = require('webpack');
const path = require('path');

const devBuild = process.env.NODE_ENV !== 'production';
const nodeEnv = devBuild ? 'development' : 'production';

config = {
  entry: {
    webpackbundle: ['es5-shim/es5-shim',
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

      //include stylesheets
      './stylesheets/bootstrap.min',
      './stylesheets/agency',
      './stylesheets/font-awesome.min',
    ],

    RailsAdminBundle: [
      // Include Rails_admin js
      './javascripts/rails_admin/jquery.colorpicker',
      './javascripts/rails_admin/jquery.pjax',
      './javascripts/rails_admin/nav.ui',
      './javascripts/rails_admin/ra.filter-box',
      './javascripts/rails_admin/ra.filtering-multiselect',
      './javascripts/rails_admin/ra.filtering-select',
      './javascripts/rails_admin/ra.i18n',
      './javascripts/rails_admin/ra.nested-form-hooks',
      './javascripts/rails_admin/ra.remote-form',
      './javascripts/rails_admin/ra.widgets',
      './javascripts/rails_admin/rails_admin',
      './javascripts/rails_admin/ui',
      './stylesheets/font-awesome.min',
    ]
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
