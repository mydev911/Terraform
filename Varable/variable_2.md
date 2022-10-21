## type of variable in terraform
* `string` -
* `number` -
* `list` -
* `map` -
```diff
+ comment...
```


#### Put value when run terraform file
```diff
- new version we do not have to use "" . but older version of terraform we need to use ...
```
```
variable "instancetype" {
type = string 
}
```
* ` must put default value...` -
```
variable "aws_zone" {
type = list 
default =[ "us-east-1a", "us-west-1a" ]
}
```
![terraform variable](https://user-images.githubusercontent.com/23219981/197250484-b705fbe0-3ac5-4db7-8434-a0b77f0603fb.jpg)

