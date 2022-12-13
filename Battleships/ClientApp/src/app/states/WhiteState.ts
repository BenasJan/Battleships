import {GameStyleState} from "./GameStyleState";
import {RedState} from "./RedState";

export class WhiteState extends GameStyleState {
  changeState(): GameStyleState {
    console.log("White state active");

    this.context.color = "pink";
    this.context.chanceToMiss = 75;
    return this.context.styleState = new RedState(this.context);
  }
}
