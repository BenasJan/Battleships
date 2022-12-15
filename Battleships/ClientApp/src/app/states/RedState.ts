import {GameStyleState} from "./GameStyleState";
import {WhiteState} from "./WhiteState";
import {GreenState} from "./GreenState";

export class RedState extends GameStyleState {
  changeState(): GameStyleState {
    console.log("Red state active");
    this.context.color = "red";
    this.context.chanceToMiss = 50;
    return this.context.styleState = new GreenState(this.context);
  }
}
