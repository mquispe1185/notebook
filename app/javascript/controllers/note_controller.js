import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    var my_table = $('#notes').DataTable();
  }
}