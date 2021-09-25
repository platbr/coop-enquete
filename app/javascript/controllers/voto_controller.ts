import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voto"
export default class extends Controller {
  declare checkboxTargets: HTMLInputElement[]
  declare qtdTarget: HTMLInputElement
  
  
  declare maximoValue: Number;
  static targets: string[] = ['checkbox', 'qtd'];
  static values = { maximo: Number }
  
  initialize () {
    this.toggle = this.toggle.bind(this)
    // this.refresh = this.refresh.bind(this)
  }

  connect (): void {
    console.log('VotoController: ' + String(this.maximoValue))
    this.checkboxTargets.forEach(checkbox => checkbox.addEventListener('click', this.toggle))
  }

  disconnect (): void {
    this.checkboxTargets.forEach(checkbox => checkbox.removeEventListener('click', this.toggle))
  }

  toggle (e: Event): void {
    if(this.checked.length <= this.maximoValue) {
      this.qtdTarget.textContent = String(this.checked.length)
    } else {
      e.preventDefault();
    }
  }

  get checked (): HTMLInputElement[] {
    return this.checkboxTargets.filter(checkbox => checkbox.checked)
  }

  get unchecked (): HTMLInputElement[] {
    return this.checkboxTargets.filter(checkbox => !checkbox.checked)
  }
}
