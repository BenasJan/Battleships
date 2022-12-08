import {GameStyleState} from "./GameStyleState";
import {WhiteState} from "./WhiteState";
import {GreenState} from "./GreenState";

export class RedState extends GameStyleState {
  changeColor(): GameStyleState {
    console.log("Red state active");
    this.context.color = "red";
    return new GreenState(this.context);
  }
}
