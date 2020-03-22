
# Plotly


[Plotly.swift] is composed of two parts arranged as a pipeline. First, the code generation reads a JSON schema and transforms it into an equivalent Swift data structure. The rest of the library is then responsible for building the publicly visible API around the generated code. When the API is used to display a chart, the chart is transformed into an equivalent JSON that matches the schema. The JSON data is then passed to [Plotly.js] that is responsible for rendering and handling of user interactions.

The following document describes the second half of the pipeline.

![Plotly Charts]


## Motivation

This library is meant to scratch my own itching that has developed while I was ~~fooling around~~ working with numerical code in Swift. Hopefully, it will be also useful to others so I can justify the time I sunk into the project.

As of the time of writing [Swift numerical][Swift Numerics] [computing ecosystem][Swift for TensorFlow] has two options to create plots - [Matplotlib] or [SwiftPlot]. There are of course other choices but these two seem to be by far the most popular.

[SwiftPlot] has a very nice native API but it supports a only limited set of plot types. The plots themselves are rendered as static images and after a plot is created it's not possible to interact with it in any way. This drawback is easy to miss at the first sight but it quickly becomes obvious when one is doing real work. Real data are noisy and have outliers. Therefore the interesting region of the data is more often than not disproportionately small to see because the outliers blow up the scale of the graph. Zooming onto the region requires modification of the code which becomes quickly tiring if the data are variable enough.

[Matplotlib] requires crossing the bridge to Python and arguably has very alien API. This is especially evident when viewed from the Swift perspective. Some people even hold a rather extreme view that it actually doesn't have any API at all... Reason why [matplotlib] code is so ugly is simply age. Roots of the various plotting functions can be tracked all the way back to Matlab which was designed in the 80s. On the other hand, the code is also very concise, stable and supports literally every feature under the sun. Because of Matplotlib's popularity and rich feature set it's very hard to provide a compelling alternative. From the purely API standpoint, it would be a huge win for humanity if [Matplotlib] never gets ported to Swift.


## Implementation

Plotly is originally a JavaScript data visualization library build on top of D3 and WebGL. It supports supports a wide range of statistical, scientific, financial, geographic, and 3-dimensional visualizations. The library was initially developed by a Canadian startup with the same name - Plotly Inc. as. The portfolio of their commercial visualization offerings is centered around it and provides . In 2015, the library was open sourced under the MIT license. It can be used fully offline  and doesn't require any external communication.


Plotly.js provides a flexible range of configuration options to control the appearance of a figure’s traces and layout, and it will attempt to compute reasonable defaults for properties not specified by the user.
To improve the experience of interactively refining a figure’s appearance, it is very helpful to provide the user with the default values of unspecified properties. For example, if a user would like to specify a scatter trace marker size that is slightly larger than the default, it is very helpful for the user to know that the default value is 6.
Default property information for traces may be determined by comparing the data and _fullData variables of the Plotly.js figure. Any property value specified in _fullData that is not specified in data is considered a default property value. Similarly, the layout and _fullLayout variables may be used to determine default values for layout properties.

Following Swift documentation is really helpful to understand how are the Swift trace objects encoded to JSON.
 - [Encodable Protocol][`Encodable`]
 - [Encoding Custom Types]

[Plotly.py] serves the same purpose and has the same goals as [Plotly.swift] but it targets Python instead. This paper very nicely explains how it works under the hood.
 - [Bringing ipywidgets support to plotly.py]
 
### Overview



After the open sourcing, a number of additional bindings for other languages were developed. For example [R](), [Julia] and [Python](). 

Plotly figures are fully defined by a declarative JSON specification. Key components of this specification are shown in the example in Figure 1.
The top-level 'data' property contains an array of the traces present in the figure. The object representing each trace contains a 'type' property that identifies the trace type (e.g. 'scatter', 'bar', 'violin', 'mesh3d', etc.). The remaining properties are used to configure the trace. As of version 1.37.1, Plotly.js sup- ports 32 distinct trace types covering many statistical, scientific, financial, geographic, and 3-dimensional use-cases.
The top-level 'layout' property is an object with properties that specify characteristics of the figure that are independent of its traces. These include the figure’s size, axis extents, legend styling, background color, and many others.


## Building and Testing

Library exposes the targets required for building in the package manifest file. It can be built and executed from within [XCode] by opening `Package.swift` file or with [Swift Package Manager] tools on the command line.

```shell
swift build
swift test 
```





[Plotly Charts]: https://raw.githubusercontent.com/cldougl/plot_images/add_r_img/plotly_2017.png

[Swift Numerics]: https://swift.org/blog/numerics/
[Swift for TensorFlow]: https://www.tensorflow.org/swift/
[Matplotlib]: https://matplotlib.org
[SwiftPlot]: https://github.com/KarthikRIyer/swiftplot

[`Encodable`]: https://developer.apple.com/documentation/swift/encodable
[Encoding Custom Types]: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
[Bringing ipywidgets support to plotly.py]: http://conference.scipy.org/proceedings/scipy2018/pdfs/jon_mease.pdf

[XCode]: https://developer.apple.com/xcode/
[Swift Package Manager]: https://swift.org/package-manager/

[Plotly.swift]: https://github.com/vojtamolda/Plotly.swift/
[Plotly.py]: https://github.com/plotly/plotly.py
[Plotly.js]: https://github.com/plotly/plotly.js/
