import { AbstractInput } from "./abstract-input";

export class BlueInput extends AbstractInput {
  Interpret(event: KeyboardEvent): void {
    console.log(event.key);
    this.context.backgroundColor = 'blue';
  }

}
