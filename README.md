![example workflow](https://github.com/gpcz/cl-uniquifier/actions/workflows/testsbcl.yml/badge.svg)
![example workflow](https://github.com/gpcz/cl-uniquifier/actions/workflows/testccl.yml/badge.svg)
![example workflow](https://github.com/gpcz/cl-uniquifier/actions/workflows/testecl.yml/badge.svg)
![example workflow](https://github.com/gpcz/cl-uniquifier/actions/workflows/testallegro.yml/badge.svg)

# cl-uniquifier
Produces a function that will return a new simple unique symbol for every symbol or string that is introduced.  Good for generating files that require simple names for things, code obfuscation, etc.

## Example
```
CL-USER> (let ((uniquifier (cl-uniquifier:make-uniquifier)))
           (format t "~S~%" (funcall uniquifier :big-long-symbol))
           (format t "~S~%" (funcall uniquifier :another-big-long-symbol))
           (format t "~S~%" (funcall uniquifier :big-long-symbol)))
A1
A2
A1
```