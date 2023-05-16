import { AddPerson } from "../const";

export function createAddPersonAction(data) {
  return { type: AddPerson, data };
}
