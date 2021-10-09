# tsnodewronglinenumber

This repository contains a set of files showing that ts-node error stack provide wrong line numbers.

The problem is tricky to reproduce, as it seem to depend on what module is imported, etc.

To reproduce, run `sh ./run.sh`. It will show that with `tsc` the line numbers are correct, and that with some modules the lines are correct, while with `ts-node` and some module, they are incorrect.

Output of the test:
```
$  sh run.sh
==> Checking with zwave-js with tsc and ts-node on js file:
$ rm -fr dist; tsc; ts-node dist/err_check.js
node_modules/zwave-js/build/lib/node/Node.d.ts:21:22 - error TS2420: Class 'ZWaveNode' incorrectly implements interface 'SecurityClassOwner'.
  Property 'securityClasses' is missing in type 'ZWaveNode' but required in type 'SecurityClassOwner'.

21 export declare class ZWaveNode extends Endpoint implements SecurityClassOwner {
                        ~~~~~~~~~

  node_modules/@zwave-js/core/build/security/SecurityClass.d.ts:24:14
    24     readonly securityClasses: Map<SecurityClass, boolean>;
                    ~~~~~~~~~~~~~~~
    'securityClasses' is declared here.


Found 1 error.


Loading zwave-js
line number should be 7, is 7, OK

==> Checking with zwave-js with ts-node:
$ ts-node err_check.ts

Loading zwave-js
line number should be 7, is 8, =====> KO <=====

==> Checking with ts-md5 with tsc and ts-node on js file:
$ rm -fr dist; tsc; ts-node dist/err_check.js

Loading ts-md5
line number should be 7, is 7, OK

==> Checking with ts-md5 with ts-node:
$ ts-node err_check.ts

Loading ts-md5
line number should be 7, is 7, OK

```

The versions I am using:
```
$ ts-node -vvv
ts-node v10.2.1
node v14.16.0
compiler v4.4.3
```
