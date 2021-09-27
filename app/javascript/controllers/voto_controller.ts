import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voto"
export default class extends Controller {
  declare checkboxTargets: HTMLInputElement[]
  declare qtdTarget: HTMLInputElement
  declare escolhidasTarget: HTMLInputElement
  
  
  declare maximoValue: Number;
  static targets: string[] = ['checkbox', 'qtd', 'escolhidas'];
  static values = { maximo: Number, escolhidas: [] }
  
  initialize () {
    this.toggle = this.toggle.bind(this)
  }

  parseEscolhidas(): Number[] {
    return JSON.parse(this.escolhidasTarget.value)
  }

  connect (): void {
    console.log('VotoController: ' + String(this.maximoValue))
    const escolhidasValue = this.parseEscolhidas();

    this.checkboxTargets.forEach(checkbox => checkbox.addEventListener('click', this.toggle))
    this.checkboxTargets.forEach(checkbox => {
      const opcaoId = Number(checkbox.getAttribute('opcao_id'))
      if(escolhidasValue.indexOf(opcaoId) != -1){
        checkbox.checked = true
      }
    })
    this.atualizarMostradorDeQtd()
  }

  disconnect (): void {
    this.checkboxTargets.forEach(checkbox => checkbox.removeEventListener('click', this.toggle))
  }

  toggle (e: Event): void {
    if(this.checked.length <= this.maximoValue) {
      const target = (e.target as HTMLInputElement)
      const opcaoId = Number(target.getAttribute('opcao_id'))
      if(target && target.checked) {
        this.adicionarOpcaoId(opcaoId)
      } else {
        this.removerOpcaoId(opcaoId)
      }
      this.atualizarMostradorDeQtd()
      return;
    }
    alert('O número máximo de opções já foi escolhido, desmarque outras opções para poder escolher esta.')
    e.preventDefault()
  }

  atualizarMostradorDeQtd(): void {
    this.qtdTarget.textContent = String(this.checked.length)
  }

  adicionarOpcaoId(opcaoId: Number): void {
    const escolhidasValue = this.parseEscolhidas()
    escolhidasValue.push(opcaoId)
    this.escolhidasTarget.value = this.escolhidasTarget.value = JSON.stringify(escolhidasValue)
  }

  removerOpcaoId(opcaoId: Number): void {
    const escolhidasValue = this.parseEscolhidas();
    const index = escolhidasValue.indexOf(opcaoId, 0)
    if (index > -1) {
      escolhidasValue.splice(index, 1)
    }
    this.escolhidasTarget.value = JSON.stringify(escolhidasValue)
  }

  get checked (): HTMLInputElement[] {
    return this.checkboxTargets.filter(checkbox => checkbox.checked)
  }

  get unchecked (): HTMLInputElement[] {
    return this.checkboxTargets.filter(checkbox => !checkbox.checked)
  }
}
