/// Use a streamtube trace to visualize flow in a vector field.
/// 
/// Specify a vector field using 6 1D arrays of equal length, 3 position arrays `x`, `y` and `z` and
/// 3 vector component arrays `u`, `v`, and `w`. By default, the tubes' starting positions will be
/// cut from the vector field's x-z plane at its minimum y value. To specify your own starting
/// position, use attributes `starts.x`, `starts.y` and `starts.z`. The color is encoded by the norm
/// of (u, v, w), and the local radius by the divergence of (u, v, w).
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#streamtube), 
///   [JavaScript](https://plot.ly/javascript/reference/#streamtube) or 
///   [R](https://plot.ly/r/reference/#streamtube)
public struct StreamTube<XYZData, UVWData>: Trace, SceneSubplot where XYZData: Plotable, UVWData: Plotable {
    public let type: String = "streamtube"

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

    /// Sets the x coordinates of the vector field.
    public var x: XYZData? = nil

    /// Sets the y coordinates of the vector field.
    public var y: XYZData? = nil

    /// Sets the z coordinates of the vector field.
    public var z: XYZData? = nil

    /// Sets the x components of the vector field.
    public var u: UVWData? = nil

    /// Sets the y components of the vector field.
    public var v: UVWData? = nil

    /// Sets the z components of the vector field.
    public var w: UVWData? = nil

    public struct Starts: Encodable {
        /// Sets the x components of the starting position of the streamtubes
        public var x: [Double]? = nil
    
        /// Sets the y components of the starting position of the streamtubes
        public var y: [Double]? = nil
    
        /// Sets the z components of the starting position of the streamtubes
        public var z: [Double]? = nil
    
        /// Creates `Starts` object with specified properties.
        /// 
        /// - Parameters:
        ///   - x: Sets the x components of the starting position of the streamtubes
        ///   - y: Sets the y components of the starting position of the streamtubes
        ///   - z: Sets the z components of the starting position of the streamtubes
        public init(x: [Double]? = nil, y: [Double]? = nil, z: [Double]? = nil) {
            self.x = x
            self.y = y
            self.z = z
        }
        
    }
    public var starts: Starts? = nil

    /// The maximum number of displayed segments in a streamtube.
    public var maxDisplayed: Int? = nil

    /// The scaling factor for the streamtubes.
    /// 
    /// The default is 1, which avoids two max divergence tubes from touching at adjacent starting
    /// positions.
    public var sizeReference: Double? = nil

    /// Sets a text element associated with this trace.
    /// 
    /// If trace `hoverinfo` contains a *text* flag, this text element will be seen in all hover labels.
    /// Note that streamtube traces do not support array `text` values.
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
    /// true`) are available. variables `tubex`, `tubey`, `tubez`, `tubeu`, `tubev`, `tubew`, `norm` and
    /// `divergence`. Anything contained in tag `<extra>` is displayed in the secondary box, for example
    /// "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag
    /// `<extra></extra>`.
    public var hoverTemplate: Data<String>? = nil

    /// Determines whether or not the color domain is computed with respect to the input data (here
    /// u/v/w norm) or the bounds set in `cmin` and `cmax` Defaults to `false` when `cmin` and `cmax`
    /// are set by the user.
    public var cAuto: Bool? = nil

    /// Sets the lower bound of the color domain.
    /// 
    /// Value should have the same units as u/v/w norm and if set, `cmax` must be set as well.
    public var cMin: Double? = nil

    /// Sets the upper bound of the color domain.
    /// 
    /// Value should have the same units as u/v/w norm and if set, `cmin` must be set as well.
    public var cMax: Double? = nil

    /// Sets the mid-point of the color domain by scaling `cmin` and/or `cmax` to be equidistant to this
    /// point.
    /// 
    /// Value should have the same units as u/v/w norm. Has no effect when `cauto` is `false`.
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

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public struct HoverInfo: OptionSet, Encodable {
        public let rawValue: Int
        public static var x: HoverInfo { HoverInfo(rawValue: 1 << 0) }
        public static var y: HoverInfo { HoverInfo(rawValue: 1 << 1) }
        public static var z: HoverInfo { HoverInfo(rawValue: 1 << 2) }
        public static var u: HoverInfo { HoverInfo(rawValue: 1 << 3) }
        public static var v: HoverInfo { HoverInfo(rawValue: 1 << 4) }
        public static var w: HoverInfo { HoverInfo(rawValue: 1 << 5) }
        public static var norm: HoverInfo { HoverInfo(rawValue: 1 << 6) }
        public static var divergence: HoverInfo { HoverInfo(rawValue: 1 << 7) }
        public static var text: HoverInfo { HoverInfo(rawValue: 1 << 8) }
        public static var name: HoverInfo { HoverInfo(rawValue: 1 << 9) }
        public static var all: HoverInfo { HoverInfo(rawValue: 1 << 10) }
        public static var none: HoverInfo { HoverInfo(rawValue: 1 << 11) }
        public static var skip: HoverInfo { HoverInfo(rawValue: 1 << 12) }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["x"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["y"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["z"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["u"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["v"] }
            if (self.rawValue & 1 << 5) != 0 { options += ["w"] }
            if (self.rawValue & 1 << 6) != 0 { options += ["norm"] }
            if (self.rawValue & 1 << 7) != 0 { options += ["divergence"] }
            if (self.rawValue & 1 << 8) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 9) != 0 { options += ["name"] }
            if (self.rawValue & 1 << 10) != 0 { options += ["all"] }
            if (self.rawValue & 1 << 11) != 0 { options += ["none"] }
            if (self.rawValue & 1 << 12) != 0 { options += ["skip"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public var hoverInfo: HoverInfo? = nil

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
        case u
        case v
        case w
        case starts
        case maxDisplayed = "maxdisplayed"
        case sizeReference = "sizeref"
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
        case hoverInfo = "hoverinfo"
        case scene
    }
    
    /// Creates `StreamTube` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - x: Sets the x coordinates of the vector field.
    ///   - y: Sets the y coordinates of the vector field.
    ///   - z: Sets the z coordinates of the vector field.
    ///   - u: Sets the x components of the vector field.
    ///   - v: Sets the y components of the vector field.
    ///   - w: Sets the z components of the vector field.
    ///   - text: Sets a text element associated with this trace.
    ///   - hoverText: Same as `text`.
    ///   - colorScale: Sets the colorscale.
    ///   - reverseScale: Reverses the color mapping if true.
    public init(name: String? = nil, x: XYZData? = nil, y: XYZData? = nil, z: XYZData? = nil, u:
            UVWData? = nil, v: UVWData? = nil, w: UVWData? = nil, text: Data<String>? = nil, hoverText:
            Data<String>? = nil, colorScale: ColorScale? = nil, reverseScale: Bool? = nil) {
        self.name = name
        self.x = x
        self.y = y
        self.z = z
        self.u = u
        self.v = v
        self.w = w
        self.text = text
        self.hoverText = hoverText
        self.colorScale = colorScale
        self.reverseScale = reverseScale
    }
    
    /// Creates `StreamTube` object with specified properties.
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
    ///   - x: Sets the x coordinates of the vector field.
    ///   - y: Sets the y coordinates of the vector field.
    ///   - z: Sets the z coordinates of the vector field.
    ///   - u: Sets the x components of the vector field.
    ///   - v: Sets the y components of the vector field.
    ///   - w: Sets the z components of the vector field.
    ///   - starts:
    ///   - maxDisplayed: The maximum number of displayed segments in a streamtube.
    ///   - sizeReference: The scaling factor for the streamtubes.
    ///   - text: Sets a text element associated with this trace.
    ///   - hoverText: Same as `text`.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - cAuto: Determines whether or not the color domain is computed with respect to the input data
    ///   (here u/v/w norm) or the bounds set in `cmin` and `cmax` Defaults to `false` when `cmin` and
    ///   `cmax` are set by the user.
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
    ///   - hoverInfo: Determines which trace information appear on hover.
    ///   - scene: Sets a reference between this trace's 3D coordinate system and a 3D scene.
    public init(visible: Shared.Visible? = nil, name: String? = nil, uid: String? = nil, ids:
            [String]? = nil, customData: [String]? = nil, meta: Data<Anything>? = nil, hoverLabel:
            Shared.HoverLabel? = nil, stream: Shared.Stream? = nil, uiRevision: Anything? = nil, x: XYZData?
            = nil, y: XYZData? = nil, z: XYZData? = nil, u: UVWData? = nil, v: UVWData? = nil, w: UVWData? =
            nil, starts: Starts? = nil, maxDisplayed: Int? = nil, sizeReference: Double? = nil, text:
            Data<String>? = nil, hoverText: Data<String>? = nil, hoverTemplate: Data<String>? = nil, cAuto:
            Bool? = nil, cMin: Double? = nil, cMax: Double? = nil, cMiddle: Double? = nil, colorScale:
            ColorScale? = nil, autoColorScale: Bool? = nil, reverseScale: Bool? = nil, showScale: Bool? =
            nil, colorBar: Shared.ColorBar? = nil, colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1),
            opacity: Double? = nil, lightPosition: Shared.LightPosition? = nil, lighting: Shared.Lighting? =
            nil, hoverInfo: HoverInfo? = nil, scene: Layout.Scene = Layout.Scene(uid: 1)) {
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
        self.u = u
        self.v = v
        self.w = w
        self.starts = starts
        self.maxDisplayed = maxDisplayed
        self.sizeReference = sizeReference
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
        if let u = self.u {
            try u.encode(toPlotly: container.superEncoder(forKey: .u))
        }
        if let v = self.v {
            try v.encode(toPlotly: container.superEncoder(forKey: .v))
        }
        if let w = self.w {
            try w.encode(toPlotly: container.superEncoder(forKey: .w))
        }
        try container.encodeIfPresent(starts, forKey: .starts)
        try container.encodeIfPresent(maxDisplayed, forKey: .maxDisplayed)
        try container.encodeIfPresent(sizeReference, forKey: .sizeReference)
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
        try container.encodeIfPresent(hoverInfo, forKey: .hoverInfo)
        try container.encode("scene\(scene.uid)", forKey: .scene)
    }
}