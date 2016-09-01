import React, { PropTypes } from 'react';
import {Chart} from 'react-google-charts';

export default class ChartWidget extends React.Component {
  render()
  {
  return (
    <div className="row">
      <div className="col-xs-12">
        <div>
          <Chart chartType = "PieChart" width = "100%" data = {[["Task","Hours per Day"],["Lorem",11],["Rhoncus",2],["Ipsum",2],["Vivamus purus ",2],["Morbi",7]]} options = {{"title":"Our Sales Record","pieHole":0.8,"is3D":true}} graph_id = "SalesPieChart" />
        </div>
      </div>
    </div>
    );
  }
}
