/// Draws isosurfaces between iso-min and iso-max values with coordinates given by four
/// 1-dimensional arrays containing the `value`, `x`, `y` and `z` of every vertex of a uniform or
/// non-uniform 3-D grid.
/// 
/// Horizontal or vertical slices, caps as well as spaceframe between iso-min and iso-max values
/// could also be drawn using this trace.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#isosurface), 
///   [JavaScript](https://plot.ly/javascript/reference/#isosurface) or 
///   [R](https://plot.ly/r/reference/#isosurface)
public struct Isosurface<XData, YData, ZData, ValueData>: Trace, SceneSubplot where XData: Plotable, YData: Plotable, ZData: Plotable, ValueData: Plotable {
    public let type: String = "isosurface"

    public let animatable: Bool = false

    /// Determines whether or not this trace is visible.
    /// 
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    public var visible: Shared.Visible? = nil

    /// Sets the trace name.
    /// 
    /// The trace name appear as the legend item and on hover.
    public var name: String? = nil

    /// Assign an id to this trace, Use this to provide object constancy between traces during
    /// animations and transitions.
    public var uid: String? = nil

    /// Assigns id labels to each datum.
    /// 
    /// These ids for object constancy of data points during animation. Should be an array of strings,
    /// not numbers or any other type.
    public var ids: [String]? = nil

    /// Assigns extra data each datum.
    /// 
    /// This may be useful when listening to hover, click and selection events. Note that, *scatter*
    /// traces also appends customdata items in the markers DOM elements
    public var customData: [String]? = nil

    /// Assigns extra meta information associated with this trace that can be used in various text
    /// attributes.
    /// 
    /// Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text`
    /// `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the
    /// trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the
    /// index or key of the `meta` item in question. To access trace `meta` in layout attributes, use
    /// `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    public var meta: Data<Anything>? = nil

    public var hoverLabel: Shared.HoverLabel? = nil

    public var stream: Shared.Stream? = nil

    /// Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords`
    /// traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`.
    /// 
    /// Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are
    /// controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`,
    /// `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible
    /// with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are
    /// tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app
    /// can add/remove traces before the end of the `data` array, such that the same trace has a
    /// different index, you can still preserve user-driven changes if you give each trace a `uid` that
    /// stays with it as it moves.
    public var uiRevision: Anything? = nil

    /// Sets the X coordinates of the vertices on X axis.
    public var x: XData? = nil

    /// Sets the Y coordinates of the vertices on Y axis.
    public var y: YData? = nil

    /// Sets the Z coordinates of the vertices on Z axis.
    public var z: ZData? = nil

    /// Sets the 4th dimension (value) of the vertices.
    public var value: ValueData? = nil

    /// Sets the minimum boundary for iso-surface plot.
    public var isoMin: Double? = nil

    /// Sets the maximum boundary for iso-surface plot.
    public var isoMax: Double? = nil

    public struct Surface: Encodable {
        /// Hides/displays surfaces between minimum and maximum iso-values.
        public var show: Bool? = nil
    
        /// Sets the number of iso-surfaces between minimum and maximum iso-values.
        /// 
        /// By default this value is 2 meaning that only minimum and maximum surfaces would be drawn.
        public var count: Int? = nil
    
        /// Sets the fill ratio of the iso-surface.
        /// 
        /// The default fill value of the surface is 1 meaning that they are entirely shaded. On the other
        /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
        /// edges.
        public var fill: Double? = nil
    
        /// Sets the surface pattern of the iso-surface 3-D sections.
        /// 
        /// The default pattern of the surface is `all` meaning that the rest of surface elements would be
        /// shaded. The check options (either 1 or 2) could be used to draw half of the squares on the
        /// surface. Using various combinations of capital `A`, `B`, `C`, `D` and `E` may also be used to
        /// reduce the number of triangles on the iso-surfaces and creating other patterns of interest.
        public struct Pattern: OptionSet, Encodable {
            public let rawValue: Int
            public static var a: Pattern { Pattern(rawValue: 1 << 0) }
            public static var b: Pattern { Pattern(rawValue: 1 << 1) }
            public static var c: Pattern { Pattern(rawValue: 1 << 2) }
            public static var d: Pattern { Pattern(rawValue: 1 << 3) }
            public static var e: Pattern { Pattern(rawValue: 1 << 4) }
            public static var all: Pattern { Pattern(rawValue: 1 << 5) }
            public static var odd: Pattern { Pattern(rawValue: 1 << 6) }
            public static var even: Pattern { Pattern(rawValue: 1 << 7) }
            
            public init(rawValue: Int) {
                self.rawValue = rawValue
            }
            
            public func encode(to encoder: Encoder) throws {
                var options = [String]()
                if (self.rawValue & 1 << 0) != 0 { options += ["A"] }
                if (self.rawValue & 1 << 1) != 0 { options += ["B"] }
                if (self.rawValue & 1 << 2) != 0 { options += ["C"] }
                if (self.rawValue & 1 << 3) != 0 { options += ["D"] }
                if (self.rawValue & 1 << 4) != 0 { options += ["E"] }
                if (self.rawValue & 1 << 5) != 0 { options += ["all"] }
                if (self.rawValue & 1 << 6) != 0 { options += ["odd"] }
                if (self.rawValue & 1 << 7) != 0 { options += ["even"] }
                var container = encoder.singleValueContainer()
                try container.encode(options.joined(separator: "+"))
            }
        }
        /// Sets the surface pattern of the iso-surface 3-D sections.
        /// 
        /// The default pattern of the surface is `all` meaning that the rest of surface elements would be
        /// shaded. The check options (either 1 or 2) could be used to draw half of the squares on the
        /// surface. Using various combinations of capital `A`, `B`, `C`, `D` and `E` may also be used to
        /// reduce the number of triangles on the iso-surfaces and creating other patterns of interest.
        public var pattern: Pattern? = nil
    
        /// Creates `Surface` object with specified properties.
        /// 
        /// - Parameters:
        ///   - show: Hides/displays surfaces between minimum and maximum iso-values.
        ///   - count: Sets the number of iso-surfaces between minimum and maximum iso-values.
        ///   - fill: Sets the fill ratio of the iso-surface.
        ///   - pattern: Sets the surface pattern of the iso-surface 3-D sections.
        public init(show: Bool? = nil, count: Int? = nil, fill: Double? = nil, pattern: Pattern? = nil)
                {
            self.show = show
            self.count = count
            self.fill = fill
            self.pattern = pattern
        }
        
    }
    public var surface: Surface? = nil

    public struct SpaceFrame: Encodable {
        /// Displays/hides tetrahedron shapes between minimum and maximum iso-values.
        /// 
        /// Often useful when either caps or surfaces are disabled or filled with values less than 1.
        public var show: Bool? = nil
    
        /// Sets the fill ratio of the `spaceframe` elements.
        /// 
        /// The default fill value is 0.15 meaning that only 15% of the area of every faces of tetras would
        /// be shaded. Applying a greater `fill` ratio would allow the creation of stronger elements or
        /// could be sued to have entirely closed areas (in case of using 1).
        public var fill: Double? = nil
    
        /// Creates `SpaceFrame` object with specified properties.
        /// 
        /// - Parameters:
        ///   - show: Displays/hides tetrahedron shapes between minimum and maximum iso-values.
        ///   - fill: Sets the fill ratio of the `spaceframe` elements.
        public init(show: Bool? = nil, fill: Double? = nil) {
            self.show = show
            self.fill = fill
        }
        
    }
    public var spaceFrame: SpaceFrame? = nil

    public struct Slices: Encodable {
        public struct X: Encodable {
            /// Determines whether or not slice planes about the x dimension are drawn.
            public var show: Bool? = nil
        
            /// Specifies the location(s) of slices on the axis.
            /// 
            /// When not specified slices would be created for all points of the axis x except start and end.
            public var locations: [Double]? = nil
        
            /// Sets the fill ratio of the `slices`.
            /// 
            /// The default fill value of the `slices` is 1 meaning that they are entirely shaded. On the other
            /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
            /// edges.
            public var fill: Double? = nil
        
            /// Creates `X` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Determines whether or not slice planes about the x dimension are drawn.
            ///   - locations: Specifies the location(s) of slices on the axis.
            ///   - fill: Sets the fill ratio of the `slices`.
            public init(show: Bool? = nil, locations: [Double]? = nil, fill: Double? = nil) {
                self.show = show
                self.locations = locations
                self.fill = fill
            }
            
        }
        public var x: X? = nil
    
        public struct Y: Encodable {
            /// Determines whether or not slice planes about the y dimension are drawn.
            public var show: Bool? = nil
        
            /// Specifies the location(s) of slices on the axis.
            /// 
            /// When not specified slices would be created for all points of the axis y except start and end.
            public var locations: [Double]? = nil
        
            /// Sets the fill ratio of the `slices`.
            /// 
            /// The default fill value of the `slices` is 1 meaning that they are entirely shaded. On the other
            /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
            /// edges.
            public var fill: Double? = nil
        
            /// Creates `Y` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Determines whether or not slice planes about the y dimension are drawn.
            ///   - locations: Specifies the location(s) of slices on the axis.
            ///   - fill: Sets the fill ratio of the `slices`.
            public init(show: Bool? = nil, locations: [Double]? = nil, fill: Double? = nil) {
                self.show = show
                self.locations = locations
                self.fill = fill
            }
            
        }
        public var y: Y? = nil
    
        public struct Z: Encodable {
            /// Determines whether or not slice planes about the z dimension are drawn.
            public var show: Bool? = nil
        
            /// Specifies the location(s) of slices on the axis.
            /// 
            /// When not specified slices would be created for all points of the axis z except start and end.
            public var locations: [Double]? = nil
        
            /// Sets the fill ratio of the `slices`.
            /// 
            /// The default fill value of the `slices` is 1 meaning that they are entirely shaded. On the other
            /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
            /// edges.
            public var fill: Double? = nil
        
            /// Creates `Z` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Determines whether or not slice planes about the z dimension are drawn.
            ///   - locations: Specifies the location(s) of slices on the axis.
            ///   - fill: Sets the fill ratio of the `slices`.
            public init(show: Bool? = nil, locations: [Double]? = nil, fill: Double? = nil) {
                self.show = show
                self.locations = locations
                self.fill = fill
            }
            
        }
        public var z: Z? = nil
    
        /// Creates `Slices` object with specified properties.
        public init(x: X? = nil, y: Y? = nil, z: Z? = nil) {
            self.x = x
            self.y = y
            self.z = z
        }
        
    }
    public var slices: Slices? = nil

    public struct Caps: Encodable {
        public struct X: Encodable {
            /// Sets the fill ratio of the `slices`.
            /// 
            /// The default fill value of the x `slices` is 1 meaning that they are entirely shaded. On the
            /// other hand Applying a `fill` ratio less than one would allow the creation of openings parallel
            /// to the edges.
            public var show: Bool? = nil
        
            /// Sets the fill ratio of the `caps`.
            /// 
            /// The default fill value of the `caps` is 1 meaning that they are entirely shaded. On the other
            /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
            /// edges.
            public var fill: Double? = nil
        
            /// Creates `X` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Sets the fill ratio of the `slices`.
            ///   - fill: Sets the fill ratio of the `caps`.
            public init(show: Bool? = nil, fill: Double? = nil) {
                self.show = show
                self.fill = fill
            }
            
        }
        public var x: X? = nil
    
        public struct Y: Encodable {
            /// Sets the fill ratio of the `slices`.
            /// 
            /// The default fill value of the y `slices` is 1 meaning that they are entirely shaded. On the
            /// other hand Applying a `fill` ratio less than one would allow the creation of openings parallel
            /// to the edges.
            public var show: Bool? = nil
        
            /// Sets the fill ratio of the `caps`.
            /// 
            /// The default fill value of the `caps` is 1 meaning that they are entirely shaded. On the other
            /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
            /// edges.
            public var fill: Double? = nil
        
            /// Creates `Y` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Sets the fill ratio of the `slices`.
            ///   - fill: Sets the fill ratio of the `caps`.
            public init(show: Bool? = nil, fill: Double? = nil) {
                self.show = show
                self.fill = fill
            }
            
        }
        public var y: Y? = nil
    
        public struct Z: Encodable {
            /// Sets the fill ratio of the `slices`.
            /// 
            /// The default fill value of the z `slices` is 1 meaning that they are entirely shaded. On the
            /// other hand Applying a `fill` ratio less than one would allow the creation of openings parallel
            /// to the edges.
            public var show: Bool? = nil
        
            /// Sets the fill ratio of the `caps`.
            /// 
            /// The default fill value of the `caps` is 1 meaning that they are entirely shaded. On the other
            /// hand Applying a `fill` ratio less than one would allow the creation of openings parallel to the
            /// edges.
            public var fill: Double? = nil
        
            /// Creates `Z` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Sets the fill ratio of the `slices`.
            ///   - fill: Sets the fill ratio of the `caps`.
            public init(show: Bool? = nil, fill: Double? = nil) {
                self.show = show
                self.fill = fill
            }
            
        }
        public var z: Z? = nil
    
        /// Creates `Caps` object with specified properties.
        public init(x: X? = nil, y: Y? = nil, z: Z? = nil) {
            self.x = x
            self.y = y
            self.z = z
        }
        
    }
    public var caps: Caps? = nil

    /// Sets the text elements associated with the vertices.
    /// 
    /// If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be
    /// seen in the hover labels.
    public var text: Data<String>? = nil

    /// Same as `text`.
    public var hoverText: Data<String>? = nil

    /// Template string used for rendering the information that appear on hover box.
    /// 
    /// Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example
    /// "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example
    /// "Price: %{y:$.2f}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on
    /// the formatting syntax. Dates are formatted using d3-time-format's syntax
    /// %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on
    /// the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as
    /// event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data.
    /// Additionally, every attributes that can be specified per-point (the ones that are `arrayOk:
    /// true`) are available. Anything contained in tag `<extra>` is displayed in the secondary box, for
    /// example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag
    /// `<extra></extra>`.
    public var hoverTemplate: Data<String>? = nil

    /// Determines whether or not the color domain is computed with respect to the input data (here
    /// `value`) or the bounds set in `cmin` and `cmax` Defaults to `false` when `cmin` and `cmax` are
    /// set by the user.
    public var cAuto: Bool? = nil

    /// Sets the lower bound of the color domain.
    /// 
    /// Value should have the same units as `value` and if set, `cmax` must be set as well.
    public var cMin: Double? = nil

    /// Sets the upper bound of the color domain.
    /// 
    /// Value should have the same units as `value` and if set, `cmin` must be set as well.
    public var cMax: Double? = nil

    /// Sets the mid-point of the color domain by scaling `cmin` and/or `cmax` to be equidistant to this
    /// point.
    /// 
    /// Value should have the same units as `value`. Has no effect when `cauto` is `false`.
    public var cMiddle: Double? = nil

    /// Sets the colorscale.
    /// 
    /// The colorscale must be an array containing arrays mapping a normalized value to an rgb, rgba,
    /// hex, hsl, hsv, or named color string. At minimum, a mapping for the lowest (0) and highest (1)
    /// values are required. For example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the
    /// bounds of the colorscale in color space, use`cmin` and `cmax`. Alternatively, `colorscale` may
    /// be a palette name string of the following list:
    /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
    public var colorScale: ColorScale? = nil

    /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette
    /// determined by `colorscale`.
    /// 
    /// In case `colorscale` is unspecified or `autocolorscale` is true, the default palette will be
    /// chosen according to whether numbers in the `color` array are all positive, all negative or
    /// mixed.
    public var autoColorScale: Bool? = nil

    /// Reverses the color mapping if true.
    /// 
    /// If true, `cmin` will correspond to the last color in the array and `cmax` will correspond to the
    /// first color.
    public var reverseScale: Bool? = nil

    /// Determines whether or not a colorbar is displayed for this trace.
    public var showScale: Bool? = nil

    public var colorBar: Shared.ColorBar? = nil

    /// Sets a reference to a shared color axis.
    /// 
    /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
    /// for these shared color axes are set in the layout, under `layout.coloraxis`,
    /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
    public var colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1)

    /// Sets the opacity of the surface.
    /// 
    /// Please note that in the case of using high `opacity` values for example a value greater than or
    /// equal to 0.5 on two surfaces (and 0.25 with four surfaces), an overlay of multiple transparent
    /// surfaces may not perfectly be sorted in depth by the webgl API. This behavior may be improved in
    /// the near future and is subject to change.
    public var opacity: Double? = nil

    public var lightPosition: Shared.LightPosition? = nil

    public var lighting: Shared.Lighting? = nil

    /// Determines whether or not normal smoothing is applied to the meshes, creating meshes with an
    /// angular, low-poly look via flat reflections.
    public var flatShading: Bool? = nil

    public var contour: Shared.ContourHover? = nil

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public var hoverInfo: Shared.HoverInfo? = nil

    /// Sets a reference between this trace's 3D coordinate system and a 3D scene.
    /// 
    /// If *scene* (the default value), the (x,y,z) coordinates refer to `layout.scene`. If *scene2*,
    /// the (x,y,z) coordinates refer to `layout.scene2`, and so on.
    public var scene: Layout.Scene = Layout.Scene(uid: 1)

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case type
        case visible
        case name
        case uid
        case ids
        case customData = "customdata"
        case meta
        case hoverLabel = "hoverlabel"
        case stream
        case uiRevision = "uirevision"
        case x
        case y
        case z
        case value
        case isoMin = "isomin"
        case isoMax = "isomax"
        case surface
        case spaceFrame = "spaceframe"
        case slices
        case caps
        case text
        case hoverText = "hovertext"
        case hoverTemplate = "hovertemplate"
        case cAuto = "cauto"
        case cMin = "cmin"
        case cMax = "cmax"
        case cMiddle = "cmid"
        case colorScale = "colorscale"
        case autoColorScale = "autocolorscale"
        case reverseScale = "reversescale"
        case showScale = "showscale"
        case colorBar = "colorbar"
        case colorAxis = "coloraxis"
        case opacity
        case lightPosition = "lightposition"
        case lighting
        case flatShading = "flatshading"
        case contour
        case hoverInfo = "hoverinfo"
        case scene
    }
    
    /// Creates `Isosurface` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - x: Sets the X coordinates of the vertices on X axis.
    ///   - y: Sets the Y coordinates of the vertices on Y axis.
    ///   - z: Sets the Z coordinates of the vertices on Z axis.
    ///   - value: Sets the 4th dimension (value) of the vertices.
    ///   - text: Sets the text elements associated with the vertices.
    ///   - hoverText: Same as `text`.
    ///   - colorScale: Sets the colorscale.
    ///   - reverseScale: Reverses the color mapping if true.
    public init(name: String? = nil, x: XData? = nil, y: YData? = nil, z: ZData? = nil, value:
            ValueData? = nil, text: Data<String>? = nil, hoverText: Data<String>? = nil, colorScale:
            ColorScale? = nil, reverseScale: Bool? = nil) {
        self.name = name
        self.x = x
        self.y = y
        self.z = z
        self.value = value
        self.text = text
        self.hoverText = hoverText
        self.colorScale = colorScale
        self.reverseScale = reverseScale
    }
    
    /// Creates `Isosurface` object with specified properties.
    /// 
    /// - Parameters:
    ///   - visible: Determines whether or not this trace is visible.
    ///   - name: Sets the trace name.
    ///   - uid: Assign an id to this trace, Use this to provide object constancy between traces during
    ///   animations and transitions.
    ///   - ids: Assigns id labels to each datum.
    ///   - customData: Assigns extra data each datum.
    ///   - meta: Assigns extra meta information associated with this trace that can be used in various
    ///   text attributes.
    ///   - hoverLabel:
    ///   - stream:
    ///   - uiRevision: Controls persistence of some user-driven changes to the trace: `constraintrange`
    ///   in `parcoords` traces, as well as some `editable: true` modifications such as `name` and
    ///   `colorbar.title`.
    ///   - x: Sets the X coordinates of the vertices on X axis.
    ///   - y: Sets the Y coordinates of the vertices on Y axis.
    ///   - z: Sets the Z coordinates of the vertices on Z axis.
    ///   - value: Sets the 4th dimension (value) of the vertices.
    ///   - isoMin: Sets the minimum boundary for iso-surface plot.
    ///   - isoMax: Sets the maximum boundary for iso-surface plot.
    ///   - surface:
    ///   - spaceFrame:
    ///   - slices:
    ///   - caps:
    ///   - text: Sets the text elements associated with the vertices.
    ///   - hoverText: Same as `text`.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - cAuto: Determines whether or not the color domain is computed with respect to the input data
    ///   (here `value`) or the bounds set in `cmin` and `cmax` Defaults to `false` when `cmin` and `cmax`
    ///   are set by the user.
    ///   - cMin: Sets the lower bound of the color domain.
    ///   - cMax: Sets the upper bound of the color domain.
    ///   - cMiddle: Sets the mid-point of the color domain by scaling `cmin` and/or `cmax` to be
    ///   equidistant to this point.
    ///   - colorScale: Sets the colorscale.
    ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
    ///   true`) or the palette determined by `colorscale`.
    ///   - reverseScale: Reverses the color mapping if true.
    ///   - showScale: Determines whether or not a colorbar is displayed for this trace.
    ///   - colorBar:
    ///   - colorAxis: Sets a reference to a shared color axis.
    ///   - opacity: Sets the opacity of the surface.
    ///   - lightPosition:
    ///   - lighting:
    ///   - flatShading: Determines whether or not normal smoothing is applied to the meshes, creating
    ///   meshes with an angular, low-poly look via flat reflections.
    ///   - contour:
    ///   - hoverInfo: Determines which trace information appear on hover.
    ///   - scene: Sets a reference between this trace's 3D coordinate system and a 3D scene.
    public init(visible: Shared.Visible? = nil, name: String? = nil, uid: String? = nil, ids:
            [String]? = nil, customData: [String]? = nil, meta: Data<Anything>? = nil, hoverLabel:
            Shared.HoverLabel? = nil, stream: Shared.Stream? = nil, uiRevision: Anything? = nil, x: XData? =
            nil, y: YData? = nil, z: ZData? = nil, value: ValueData? = nil, isoMin: Double? = nil, isoMax:
            Double? = nil, surface: Surface? = nil, spaceFrame: SpaceFrame? = nil, slices: Slices? = nil,
            caps: Caps? = nil, text: Data<String>? = nil, hoverText: Data<String>? = nil, hoverTemplate:
            Data<String>? = nil, cAuto: Bool? = nil, cMin: Double? = nil, cMax: Double? = nil, cMiddle:
            Double? = nil, colorScale: ColorScale? = nil, autoColorScale: Bool? = nil, reverseScale: Bool? =
            nil, showScale: Bool? = nil, colorBar: Shared.ColorBar? = nil, colorAxis: Layout.ColorAxis =
            Layout.ColorAxis(uid: 1), opacity: Double? = nil, lightPosition: Shared.LightPosition? = nil,
            lighting: Shared.Lighting? = nil, flatShading: Bool? = nil, contour: Shared.ContourHover? = nil,
            hoverInfo: Shared.HoverInfo? = nil, scene: Layout.Scene = Layout.Scene(uid: 1)) {
        self.visible = visible
        self.name = name
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.uiRevision = uiRevision
        self.x = x
        self.y = y
        self.z = z
        self.value = value
        self.isoMin = isoMin
        self.isoMax = isoMax
        self.surface = surface
        self.spaceFrame = spaceFrame
        self.slices = slices
        self.caps = caps
        self.text = text
        self.hoverText = hoverText
        self.hoverTemplate = hoverTemplate
        self.cAuto = cAuto
        self.cMin = cMin
        self.cMax = cMax
        self.cMiddle = cMiddle
        self.colorScale = colorScale
        self.autoColorScale = autoColorScale
        self.reverseScale = reverseScale
        self.showScale = showScale
        self.colorBar = colorBar
        self.colorAxis = colorAxis
        self.opacity = opacity
        self.lightPosition = lightPosition
        self.lighting = lighting
        self.flatShading = flatShading
        self.contour = contour
        self.hoverInfo = hoverInfo
        self.scene = scene
    }
    
    /// Encodes the object in a format compatible with Plotly.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(visible, forKey: .visible)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(uid, forKey: .uid)
        try container.encodeIfPresent(ids, forKey: .ids)
        try container.encodeIfPresent(customData, forKey: .customData)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(hoverLabel, forKey: .hoverLabel)
        try container.encodeIfPresent(stream, forKey: .stream)
        try container.encodeIfPresent(uiRevision, forKey: .uiRevision)
        if let x = self.x {
            try x.encode(toPlotly: container.superEncoder(forKey: .x))
        }
        if let y = self.y {
            try y.encode(toPlotly: container.superEncoder(forKey: .y))
        }
        if let z = self.z {
            try z.encode(toPlotly: container.superEncoder(forKey: .z))
        }
        if let value = self.value {
            try value.encode(toPlotly: container.superEncoder(forKey: .value))
        }
        try container.encodeIfPresent(isoMin, forKey: .isoMin)
        try container.encodeIfPresent(isoMax, forKey: .isoMax)
        try container.encodeIfPresent(surface, forKey: .surface)
        try container.encodeIfPresent(spaceFrame, forKey: .spaceFrame)
        try container.encodeIfPresent(slices, forKey: .slices)
        try container.encodeIfPresent(caps, forKey: .caps)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(hoverText, forKey: .hoverText)
        try container.encodeIfPresent(hoverTemplate, forKey: .hoverTemplate)
        try container.encodeIfPresent(cAuto, forKey: .cAuto)
        try container.encodeIfPresent(cMin, forKey: .cMin)
        try container.encodeIfPresent(cMax, forKey: .cMax)
        try container.encodeIfPresent(cMiddle, forKey: .cMiddle)
        try container.encodeIfPresent(colorScale, forKey: .colorScale)
        try container.encodeIfPresent(autoColorScale, forKey: .autoColorScale)
        try container.encodeIfPresent(reverseScale, forKey: .reverseScale)
        try container.encodeIfPresent(showScale, forKey: .showScale)
        try container.encodeIfPresent(colorBar, forKey: .colorBar)
        try container.encode("coloraxis\(colorAxis.uid)", forKey: .colorAxis)
        try container.encodeIfPresent(opacity, forKey: .opacity)
        try container.encodeIfPresent(lightPosition, forKey: .lightPosition)
        try container.encodeIfPresent(lighting, forKey: .lighting)
        try container.encodeIfPresent(flatShading, forKey: .flatShading)
        try container.encodeIfPresent(contour, forKey: .contour)
        try container.encodeIfPresent(hoverInfo, forKey: .hoverInfo)
        try container.encode("scene\(scene.uid)", forKey: .scene)
    }
}