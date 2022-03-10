import { Controller } from "@hotwired/stimulus"
import { Carousel } from "bootstrap"
 
export default class extends Controller {

    connect() {
        const carousel = new Carousel(this.element, {
            interval: 5000,
            wrap: true
        })
        carousel.cycle();
    };
  }