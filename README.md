# Neuronific

![image](https://img.shields.io/github/issues/africanSuperStar/Neuronific)
![image](https://img.shields.io/github/downloads/africanSuperStar/Neuronific)

Neuronific spawned from the notion that composable mobile applications are possible through the use of Mondaic Parser Combinators.

`Neuronific` is a spin off of the word `Neuron` which in it's own right is a simpler composite of a larger ecosystem of biological constructs, making up the brain.

# Description

Neuronific is an attempt create a `Drag n Drop` cross-platform app builder using JSON as the basis for creating views. Many derivations of similar ideas have recently spawned, however are cut short when complexity and scaling of creativity creates a problem. In the app world things should be infinitely possible. We plan to add features rapidly and with increasing usability. 

We've mapped out a plan which encompasses getting version 1.0.0 stable enough to publish an iOS application with full use of the _Human Interface Guidelines_. Of course an application is not interesting without its data. Access to a multitude of API's as well Persistent Storage are a high priority for us.

Linking data to the many possible interactions of UI Components and at different States is also a task this project hopes to solve.

![video](https://user-images.githubusercontent.com/36889192/150547623-68aebdc2-03ca-49df-b46b-5cfc8b21d236.mov)

By editing JSON files such as the following:

```javascript
{
    "uuid": "3965a8c2-5b1c-4d02-95f5-562690b7a332",
    "view": "Text",
    "init": {
        "description": "Component 1",
        "content": "Hello Border"
    },
    "modifiers": [{
        "tag": "Padding",
        "value": 25.0
    }, {
        "tag": "Border",
        "color": {
            "red": 0.7,
            "green": 0.2,
            "blue": 1.0,
            "alpha": 1.0
        },
        "width": 2.0
    }, {
        "tag":   "ForegroundColor",
        "red":   0.0,
        "green": 1.0,
        "blue":  0.0,
        "alpha": 1.0
    }],
    "layers": [{
        "tag": "AnchorPoint",
        "x": 0.5,
        "y": -0.3
    }, {
        "tag": "BorderWidth",
        "value": 5.0
    }, {
        "tag": "BorderColor",
        "red": 0.1,
        "green": 0.2,
        "blue": 0.35,
        "alpha": 1.0
    }]
}
```

Where layers is an actual representation of CALayer. You can build and compose applications for different platforms using an agnostic template.

<img width="1440" alt="Screenshot 2022-02-24 at 22 03 33" src="https://user-images.githubusercontent.com/36889192/155598811-543e60f6-6572-4c7d-9238-ef415a7c1d43.png">


