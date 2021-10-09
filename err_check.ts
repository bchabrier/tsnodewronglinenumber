/**
 * Module dependencies.
 */
import { getLoadedModuleName } from './errmodule';

console.log("Loading", getLoadedModuleName());
const lineNumber = (new Error()).stack.replace(/([^0-9]+[^:]*:)*([0-9]+):(.|[\s\S])*/m, "$2");
const shouldBe = 7;
console.log(`line number should be ${shouldBe}, is ${lineNumber},`, parseInt(lineNumber) == shouldBe ? "OK" : "=====> KO <=====");
