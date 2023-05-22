yum install yum-utils
package-cleanup --leaves
yum remove `package-cleanup --leaves`



