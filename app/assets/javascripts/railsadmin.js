//= require RailsAdminBundle.js

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

require('jquery');
require('jquery-ui-bundle');
require('font-awesome-webpack');
require('./nav.ui.js');
require('./ra.filter-box.js');
require('./ra.filtering-multiselect.js');
require('./ra.filtering-select.js');
require('./ra.i18n.coffee');
require('./ra.nested-form-hooks.coffee');
require('./ra.remote-form.js');
require('./ra.widgets.coffee');
require('../../stylesheets/font-awesome.min.css');
require('./ui.coffee');
require('./jquery.colorpicker.js');
require('./jquery.pjax.js');