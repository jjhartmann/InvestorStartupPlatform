import React from 'react'
import ReactOnRails from 'react-on-rails'
import HeaderText from '../components/SectionHeader'
import Video from '../containers/VideoContainer'

const VideoSection = (props, _railsContext) => {
  const reactComponent = (
    <section className="modify">
      <div className="container">
        <div className="row">
          <div className="col-xs-12">
            <HeaderText about_text="Video" />
            <Video source="https://www.youtube.com/embed/SYwUfCCMHvk" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare hendrerit tempor. Vestibulum porttitor ultricies iaculis. Aenean quis mi sem. Mauris feugiat lobortis feugiat. Nulla eu auctor lorem, id placerat felis. Praesent interdum magna non felis ullamcorper, sit amet feugiat quam egestas. Vivamus non lacinia eros, et tincidunt libero." header="Suspendisse sollicitudin diam"></Video>
            <Video source="https://www.youtube.com/embed/zbQfklsvNtU" text="Morbi pellentesque vulputate iaculis. Quisque ornare interdum magna ac hendrerit. Integer ullamcorper viverra suscipit. In ligula libero, varius at euismod eu, dapibus id neque. Nullam posuere cursus risus, at porttitor risus euismod vel. Proin et ullamcorper felis, et feugiat lectus. Donec urna dolor, facilisis ac bibendum ac, dapibus ullamcorper nibh. Praesent dictum magna eu mi gravida congue. Suspendisse potenti. Nunc quis fermentum neque. Ut sit amet tincidunt ligula. Sed vestibulum fermentum euismod." header="Quisque iaculis lectus id sem"></Video>
            <Video source="https://www.youtube.com/embed/PvK7XnEoy9U" text="Proin venenatis nulla mi, non luctus libero fringilla vel. In a elementum tortor, non porttitor risus. Aliquam ullamcorper pharetra arcu, in consectetur eros porttitor vel. In iaculis in turpis at elementum. Nam faucibus arcu quis neque suscipit scelerisque. Phasellus odio felis, pellentesque dictum volutpat id, maximus id est. Quisque iaculis lectus id sem pulvinar dapibus. Donec vel risus neque. Nunc pellentesque ex cursus justo euismod hendrerit eget tempus ante." header="Nunc quis fermentum neque"></Video>
            <Video source="https://www.youtube.com/embed/SYwUfCCMHvk" text="Curabitur dui velit, faucibus tempus tincidunt non, feugiat id mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at vestibulum est, vel condimentum sem. Sed tincidunt enim ac bibendum sodales. Vivamus a dignissim elit. Suspendisse efficitur tincidunt odio quis tincidunt. Cras at turpis at quam sagittis ultrices sed quis lectus. Nunc fermentum, dui ac condimentum feugiat, augue enim maximus lectus, eget lobortis magna lorem nec libero. Suspendisse sollicitudin diam at sem tincidunt, ut tristique neque gravida. In arcu nulla, hendrerit quis volutpat et, vehicula porta lorem." header="Etiam vulputate bibendum"></Video>
          </div>
        </div>
      </div>
    </section>
  );
  return reactComponent;
};

ReactOnRails.register( {VideoSection} );
