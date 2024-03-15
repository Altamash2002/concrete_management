// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import $ from 'jquery';
import select2 from './select2';
import DataTable from 'datatables.net-bs5';
window.DataTable = DataTable;

window.$ = $;
select2(window,$);