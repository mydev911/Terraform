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


