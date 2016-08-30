import React from 'react'
import ReactOnRails from 'react-on-rails'

const Test1 = (props, _railsContext) => {
  const reactComponent = (
    <div>
      Test1
    </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ Test1 });
