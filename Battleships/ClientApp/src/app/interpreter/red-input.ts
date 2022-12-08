import { AbstractInput } from "./abstract-input";

export class RedInput extends AbstractInput{
  Interpret(event: KeyboardEvent): void {
    console.log(event.key);
    this.context.backgroundColor = 'red';
  }

}
