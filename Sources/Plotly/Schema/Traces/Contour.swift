/// The data from which contour lines are computed is set in `z`.
/// 
/// Data in `z` must be a {2D array} of numbers. Say that `z` has N rows and M columns, then by
/// default, these N rows correspond to N y coordinates (set in `y` or auto-generated) and the M
/// columns correspond to M x coordinates (set in `x` or auto-generated). By setting `transpose` to
/// *true*, the above behavior is flipped.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#contour), 
///   [JavaScript](https://plot.ly/javascript/reference/#contour) or 
///   [R](https://plot.ly/r/reference/#contour)
public struct Contour<ZData, XData, YData>: Trace, XYSubplot where ZData: Plotable, XData: Plotable, YData: Plotable {
    public let type: String = "contour"

    public let animatable: Bool = false

    /// Determines whether or not this trace is visible.
    /// 
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    public var visible: Shared.Visible? = nil

    /// Determines whether or not an item corresponding to this trace is shown in the legend.
    public var showLegend: Bool? = nil

    /// Sets the legend group for this trace.
    /// 
    /// Traces part of the same legend group hide/show at the same time when toggling legend items.
    public var legendGroup: String? = nil

    /// Sets the opacity of the trace.
    public var opacity: Double? = nil

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

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public var hoverInfo: Shared.HoverInfo? = nil

    public var hoverLabel: Shared.HoverLabel? = nil

    public var stream: Shared.Stream? = nil

    public var transforms: [Shared.Transform]? = nil

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

    /// Sets the z data.
    public var z: ZData? = nil

    /// Sets the x coordinates.
    public var x: XData? = nil

    /// Alternate to `x`.
    /// 
    /// Builds a linear space of x coordinates. Use with `dx` where `x0` is the starting coordinate and
    /// `dx` the step.
    public var x0: Anything? = nil

    /// Sets the x coordinate step.
    /// 
    /// See `x0` for more info.
    public var dx: Double? = nil

    /// Sets the y coordinates.
    public var y: YData? = nil

    /// Alternate to `y`.
    /// 
    /// Builds a linear space of y coordinates. Use with `dy` where `y0` is the starting coordinate and
    /// `dy` the step.
    public var y0: Anything? = nil

    /// Sets the y coordinate step.
    /// 
    /// See `y0` for more info.
    public var dy: Double? = nil

    /// Sets the text elements associated with each z value.
    public var text: Data<String>? = nil

    /// Same as `text`.
    public var hoverText: Data<String>? = nil

    /// Transposes the z data.
    public var transpose: Bool? = nil

    /// If *array*, the heatmap's x coordinates are given by *x* (the default behavior when `x` is
    /// provided).
    /// 
    /// If *scaled*, the heatmap's x coordinates are given by *x0* and *dx* (the default behavior when
    /// `x` is not provided).
    public var xType: Shared.AxisType? = nil

    /// If *array*, the heatmap's y coordinates are given by *y* (the default behavior when `y` is
    /// provided) If *scaled*, the heatmap's y coordinates are given by *y0* and *dy* (the default
    /// behavior when `y` is not provided)
    public var yType: Shared.AxisType? = nil

    /// Sets the hover text formatting rule using d3 formatting mini-languages which are very similar to
    /// those in Python.
    /// 
    /// See: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
    public var zHoverFormat: String? = nil

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

    /// Determines whether or not gaps (i.e.
    /// 
    /// {nan} or missing values) in the `z` data have hover labels associated with them.
    public var hoverOnGaps: Bool? = nil

    /// Determines whether or not gaps (i.e.
    /// 
    /// {nan} or missing values) in the `z` data are filled in. It is defaulted to true if `z` is a one
    /// dimensional array otherwise it is defaulted to false.
    public var connectGaps: Bool? = nil

    /// Sets the fill color if `contours.type` is *constraint*.
    /// 
    /// Defaults to a half-transparent variant of the line color, marker color, or marker line color,
    /// whichever is available.
    public var fillColor: Color? = nil

    /// Determines whether or not the contour level attributes are picked by an algorithm.
    /// 
    /// If *true*, the number of contour levels can be set in `ncontours`. If *false*, set the contour
    /// level attributes in `contours`.
    public var autoContour: Bool? = nil

    /// Sets the maximum number of contour levels.
    /// 
    /// The actual number of contours will be chosen automatically to be less than or equal to the value
    /// of `ncontours`. Has an effect only if `autocontour` is *true* or if `contours.size` is missing.
    public var nContours: Int? = nil

    public var contours: Shared.Contours? = nil

    public var line: Shared.SmoothDashedLine? = nil

    /// Determines whether or not the color domain is computed with respect to the input data (here in
    /// `z`) or the bounds set in `zmin` and `zmax` Defaults to `false` when `zmin` and `zmax` are set
    /// by the user.
    public var zAuto: Bool? = nil

    /// Sets the lower bound of the color domain.
    /// 
    /// Value should have the same units as in `z` and if set, `zmax` must be set as well.
    public var zMin: Double? = nil

    /// Sets the upper bound of the color domain.
    /// 
    /// Value should have the same units as in `z` and if set, `zmin` must be set as well.
    public var zMax: Double? = nil

    /// Sets the mid-point of the color domain by scaling `zmin` and/or `zmax` to be equidistant to this
    /// point.
    /// 
    /// Value should have the same units as in `z`. Has no effect when `zauto` is `false`.
    public var zMiddle: Double? = nil

    /// Sets the colorscale.
    /// 
    /// The colorscale must be an array containing arrays mapping a normalized value to an rgb, rgba,
    /// hex, hsl, hsv, or named color string. At minimum, a mapping for the lowest (0) and highest (1)
    /// values are required. For example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the
    /// bounds of the colorscale in color space, use`zmin` and `zmax`. Alternatively, `colorscale` may
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
    /// If true, `zmin` will correspond to the last color in the array and `zmax` will correspond to the
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

    /// Sets the calendar system to use with `x` date data.
    public var xCalendar: Shared.Calendar? = nil

    /// Sets the calendar system to use with `y` date data.
    public var yCalendar: Shared.Calendar? = nil

    /// Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    /// 
    /// If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x
    /// coordinates refer to `layout.xaxis2`, and so on.
    public var xAxis: Layout.XAxis = Layout.XAxis(uid: 1)

    /// Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    /// 
    /// If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y
    /// coordinates refer to `layout.yaxis2`, and so on.
    public var yAxis: Layout.YAxis = Layout.YAxis(uid: 1)

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case type
        case visible
        case showLegend = "showlegend"
        case legendGroup = "legendgroup"
        case opacity
        case name
        case uid
        case ids
        case customData = "customdata"
        case meta
        case hoverInfo = "hoverinfo"
        case hoverLabel = "hoverlabel"
        case stream
        case transforms
        case uiRevision = "uirevision"
        case z
        case x
        case x0
        case dx
        case y
        case y0
        case dy
        case text
        case hoverText = "hovertext"
        case transpose
        case xType = "xtype"
        case yType = "ytype"
        case zHoverFormat = "zhoverformat"
        case hoverTemplate = "hovertemplate"
        case hoverOnGaps = "hoverongaps"
        case connectGaps = "connectgaps"
        case fillColor = "fillcolor"
        case autoContour = "autocontour"
        case nContours = "ncontours"
        case contours
        case line
        case zAuto = "zauto"
        case zMin = "zmin"
        case zMax = "zmax"
        case zMiddle = "zmid"
        case colorScale = "colorscale"
        case autoColorScale = "autocolorscale"
        case reverseScale = "reversescale"
        case showScale = "showscale"
        case colorBar = "colorbar"
        case colorAxis = "coloraxis"
        case xCalendar = "xcalendar"
        case yCalendar = "ycalendar"
        case xAxis = "xaxis"
        case yAxis = "yaxis"
    }
    
    /// Creates `Contour` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - z: Sets the z data.
    ///   - x: Sets the x coordinates.
    ///   - y: Sets the y coordinates.
    ///   - text: Sets the text elements associated with each z value.
    ///   - hoverText: Same as `text`.
    ///   - line:
    ///   - colorScale: Sets the colorscale.
    ///   - reverseScale: Reverses the color mapping if true.
    public init(name: String? = nil, z: ZData? = nil, x: XData? = nil, y: YData? = nil, text:
            Data<String>? = nil, hoverText: Data<String>? = nil, line: Shared.SmoothDashedLine? = nil,
            colorScale: ColorScale? = nil, reverseScale: Bool? = nil) {
        self.name = name
        self.z = z
        self.x = x
        self.y = y
        self.text = text
        self.hoverText = hoverText
        self.line = line
        self.colorScale = colorScale
        self.reverseScale = reverseScale
    }
    
    /// Creates `Contour` object with specified properties.
    /// 
    /// - Parameters:
    ///   - visible: Determines whether or not this trace is visible.
    ///   - showLegend: Determines whether or not an item corresponding to this trace is shown in the
    ///   legend.
    ///   - legendGroup: Sets the legend group for this trace.
    ///   - opacity: Sets the opacity of the trace.
    ///   - name: Sets the trace name.
    ///   - uid: Assign an id to this trace, Use this to provide object constancy between traces during
    ///   animations and transitions.
    ///   - ids: Assigns id labels to each datum.
    ///   - customData: Assigns extra data each datum.
    ///   - meta: Assigns extra meta information associated with this trace that can be used in various
    ///   text attributes.
    ///   - hoverInfo: Determines which trace information appear on hover.
    ///   - hoverLabel:
    ///   - stream:
    ///   - transforms:
    ///   - uiRevision: Controls persistence of some user-driven changes to the trace: `constraintrange`
    ///   in `parcoords` traces, as well as some `editable: true` modifications such as `name` and
    ///   `colorbar.title`.
    ///   - z: Sets the z data.
    ///   - x: Sets the x coordinates.
    ///   - x0: Alternate to `x`.
    ///   - dx: Sets the x coordinate step.
    ///   - y: Sets the y coordinates.
    ///   - y0: Alternate to `y`.
    ///   - dy: Sets the y coordinate step.
    ///   - text: Sets the text elements associated with each z value.
    ///   - hoverText: Same as `text`.
    ///   - transpose: Transposes the z data.
    ///   - xType: If *array*, the heatmap's x coordinates are given by *x* (the default behavior when `x`
    ///   is provided).
    ///   - yType: If *array*, the heatmap's y coordinates are given by *y* (the default behavior when `y`
    ///   is provided) If *scaled*, the heatmap's y coordinates are given by *y0* and *dy* (the default
    ///   behavior when `y` is not provided)
    ///   - zHoverFormat: Sets the hover text formatting rule using d3 formatting mini-languages which are
    ///   very similar to those in Python.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - hoverOnGaps: Determines whether or not gaps (i.e.
    ///   - connectGaps: Determines whether or not gaps (i.e.
    ///   - fillColor: Sets the fill color if `contours.type` is *constraint*.
    ///   - autoContour: Determines whether or not the contour level attributes are picked by an
    ///   algorithm.
    ///   - nContours: Sets the maximum number of contour levels.
    ///   - contours:
    ///   - line:
    ///   - zAuto: Determines whether or not the color domain is computed with respect to the input data
    ///   (here in `z`) or the bounds set in `zmin` and `zmax` Defaults to `false` when `zmin` and `zmax`
    ///   are set by the user.
    ///   - zMin: Sets the lower bound of the color domain.
    ///   - zMax: Sets the upper bound of the color domain.
    ///   - zMiddle: Sets the mid-point of the color domain by scaling `zmin` and/or `zmax` to be
    ///   equidistant to this point.
    ///   - colorScale: Sets the colorscale.
    ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
    ///   true`) or the palette determined by `colorscale`.
    ///   - reverseScale: Reverses the color mapping if true.
    ///   - showScale: Determines whether or not a colorbar is displayed for this trace.
    ///   - colorBar:
    ///   - colorAxis: Sets a reference to a shared color axis.
    ///   - xCalendar: Sets the calendar system to use with `x` date data.
    ///   - yCalendar: Sets the calendar system to use with `y` date data.
    ///   - xAxis: Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    ///   - yAxis: Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    public init(visible: Shared.Visible? = nil, showLegend: Bool? = nil, legendGroup: String? = nil,
            opacity: Double? = nil, name: String? = nil, uid: String? = nil, ids: [String]? = nil,
            customData: [String]? = nil, meta: Data<Anything>? = nil, hoverInfo: Shared.HoverInfo? = nil,
            hoverLabel: Shared.HoverLabel? = nil, stream: Shared.Stream? = nil, transforms:
            [Shared.Transform]? = nil, uiRevision: Anything? = nil, z: ZData? = nil, x: XData? = nil, x0:
            Anything? = nil, dx: Double? = nil, y: YData? = nil, y0: Anything? = nil, dy: Double? = nil,
            text: Data<String>? = nil, hoverText: Data<String>? = nil, transpose: Bool? = nil, xType:
            Shared.AxisType? = nil, yType: Shared.AxisType? = nil, zHoverFormat: String? = nil,
            hoverTemplate: Data<String>? = nil, hoverOnGaps: Bool? = nil, connectGaps: Bool? = nil,
            fillColor: Color? = nil, autoContour: Bool? = nil, nContours: Int? = nil, contours:
            Shared.Contours? = nil, line: Shared.SmoothDashedLine? = nil, zAuto: Bool? = nil, zMin: Double?
            = nil, zMax: Double? = nil, zMiddle: Double? = nil, colorScale: ColorScale? = nil,
            autoColorScale: Bool? = nil, reverseScale: Bool? = nil, showScale: Bool? = nil, colorBar:
            Shared.ColorBar? = nil, colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1), xCalendar:
            Shared.Calendar? = nil, yCalendar: Shared.Calendar? = nil, xAxis: Layout.XAxis =
            Layout.XAxis(uid: 1), yAxis: Layout.YAxis = Layout.YAxis(uid: 1)) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
        self.opacity = opacity
        self.name = name
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.hoverInfo = hoverInfo
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.transforms = transforms
        self.uiRevision = uiRevision
        self.z = z
        self.x = x
        self.x0 = x0
        self.dx = dx
        self.y = y
        self.y0 = y0
        self.dy = dy
        self.text = text
        self.hoverText = hoverText
        self.transpose = transpose
        self.xType = xType
        self.yType = yType
        self.zHoverFormat = zHoverFormat
        self.hoverTemplate = hoverTemplate
        self.hoverOnGaps = hoverOnGaps
        self.connectGaps = connectGaps
        self.fillColor = fillColor
        self.autoContour = autoContour
        self.nContours = nContours
        self.contours = contours
        self.line = line
        self.zAuto = zAuto
        self.zMin = zMin
        self.zMax = zMax
        self.zMiddle = zMiddle
        self.colorScale = colorScale
        self.autoColorScale = autoColorScale
        self.reverseScale = reverseScale
        self.showScale = showScale
        self.colorBar = colorBar
        self.colorAxis = colorAxis
        self.xCalendar = xCalendar
        self.yCalendar = yCalendar
        self.xAxis = xAxis
        self.yAxis = yAxis
    }
    
    /// Encodes the object in a format compatible with Plotly.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(visible, forKey: .visible)
        try container.encodeIfPresent(showLegend, forKey: .showLegend)
        try container.encodeIfPresent(legendGroup, forKey: .legendGroup)
        try container.encodeIfPresent(opacity, forKey: .opacity)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(uid, forKey: .uid)
        try container.encodeIfPresent(ids, forKey: .ids)
        try container.encodeIfPresent(customData, forKey: .customData)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(hoverInfo, forKey: .hoverInfo)
        try container.encodeIfPresent(hoverLabel, forKey: .hoverLabel)
        try container.encodeIfPresent(stream, forKey: .stream)
        try container.encodeIfPresent(transforms, forKey: .transforms)
        try container.encodeIfPresent(uiRevision, forKey: .uiRevision)
        if let z = self.z {
            try z.encode(toPlotly: container.superEncoder(forKey: .z))
        }
        if let x = self.x {
            try x.encode(toPlotly: container.superEncoder(forKey: .x))
        }
        try container.encodeIfPresent(x0, forKey: .x0)
        try container.encodeIfPresent(dx, forKey: .dx)
        if let y = self.y {
            try y.encode(toPlotly: container.superEncoder(forKey: .y))
        }
        try container.encodeIfPresent(y0, forKey: .y0)
        try container.encodeIfPresent(dy, forKey: .dy)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(hoverText, forKey: .hoverText)
        try container.encodeIfPresent(transpose, forKey: .transpose)
        try container.encodeIfPresent(xType, forKey: .xType)
        try container.encodeIfPresent(yType, forKey: .yType)
        try container.encodeIfPresent(zHoverFormat, forKey: .zHoverFormat)
        try container.encodeIfPresent(hoverTemplate, forKey: .hoverTemplate)
        try container.encodeIfPresent(hoverOnGaps, forKey: .hoverOnGaps)
        try container.encodeIfPresent(connectGaps, forKey: .connectGaps)
        try container.encodeIfPresent(fillColor, forKey: .fillColor)
        try container.encodeIfPresent(autoContour, forKey: .autoContour)
        try container.encodeIfPresent(nContours, forKey: .nContours)
        try container.encodeIfPresent(contours, forKey: .contours)
        try container.encodeIfPresent(line, forKey: .line)
        try container.encodeIfPresent(zAuto, forKey: .zAuto)
        try container.encodeIfPresent(zMin, forKey: .zMin)
        try container.encodeIfPresent(zMax, forKey: .zMax)
        try container.encodeIfPresent(zMiddle, forKey: .zMiddle)
        try container.encodeIfPresent(colorScale, forKey: .colorScale)
        try container.encodeIfPresent(autoColorScale, forKey: .autoColorScale)
        try container.encodeIfPresent(reverseScale, forKey: .reverseScale)
        try container.encodeIfPresent(showScale, forKey: .showScale)
        try container.encodeIfPresent(colorBar, forKey: .colorBar)
        try container.encode("coloraxis\(colorAxis.uid)", forKey: .colorAxis)
        try container.encodeIfPresent(xCalendar, forKey: .xCalendar)
        try container.encodeIfPresent(yCalendar, forKey: .yCalendar)
        try container.encode("x\(xAxis.uid)", forKey: .xAxis)
        try container.encode("y\(yAxis.uid)", forKey: .yAxis)
    }
}