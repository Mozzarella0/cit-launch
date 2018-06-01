/** bootstrap */
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.css';

/** bootflat */
import 'bootflat/bootflat/css/bootflat.min.css';
import 'bootflat/bootflat/js/icheck.min';
import 'bootflat/bootflat/js/jquery.fs.selecter.min';
import 'bootflat/bootflat/js/jquery.fs.stepper.min';

/** tag file */
import './tag/app.tag';
import './tag/core/header.tag';
import './tag/core/footer.tag';
import './tag/pages/home.tag';
import './tag/pages/lunch.tag';
import './tag/pages/info.tag';

/** routing */
import './route';

/** riot mount!!!!!! */
riot.mount('*');
