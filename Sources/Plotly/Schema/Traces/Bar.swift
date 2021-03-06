/// The data visualized by the span of the bars is set in `y` if `orientation` is set th *v* (the
/// default) and the labels are set in `x`.
/// 
/// By setting `orientation` to *h*, the roles are interchanged.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#bar), 
///   [JavaScript](https://plot.ly/javascript/reference/#bar) or 
///   [R](https://plot.ly/r/reference/#bar)
public struct Bar<XData, YData>: Trace, XYSubplot where XData: Plotable, YData: Plotable {
    public let type: String = "bar"

    public let animatable: Bool = true

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

    /// Array containing integer indices of selected points.
    /// 
    /// Has an effect only for traces that support selections. Note that an empty array means an empty
    /// selection where the `unselected` are turned on for all points, whereas, any other non-array
    /// values means no selection all where the `selected` and `unselected` styles have no effect.
    public var selectedPoints: Anything? = nil

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

    /// Sets text elements associated with each (x,y) pair.
    /// 
    /// If a single string, the same string appears over all the data points. If an array of string, the
    /// items are mapped in order to the this trace's (x,y) coordinates. If trace `hoverinfo` contains a
    /// *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.
    public var text: Data<String>? = nil

    /// Template string used for rendering the information text that appear on points.
    /// 
    /// Note that this will override `textinfo`. Variables are inserted using %{variable}, for example
    /// "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example
    /// "Price: %{y:$.2f}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on
    /// the formatting syntax. Dates are formatted using d3-time-format's syntax
    /// %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on
    /// the date formatting syntax. Every attributes that can be specified per-point (the ones that are
    /// `arrayOk: true`) are available.
    public var textTemplate: Data<String>? = nil

    /// Sets hover text elements associated with each (x,y) pair.
    /// 
    /// If a single string, the same string appears over all the data points. If an array of string, the
    /// items are mapped in order to the this trace's (x,y) coordinates. To be seen, trace `hoverinfo`
    /// must contain a *text* flag.
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

    /// Specifies the location of the `text`.
    /// 
    /// *inside* positions `text` inside, next to the bar end (rotated and scaled if needed). *outside*
    /// positions `text` outside, next to the bar end (scaled if needed), unless there is another bar
    /// stacked on this one, then the text gets pushed inside. *auto* tries to position `text` inside
    /// the bar, but if the bar is too small and no bar is stacked on this one the text is moved
    /// outside.
    public var textPosition: Shared.AdjacentPosition? = nil

    /// Determines if texts are kept at center or start/end points in `textposition` *inside* mode.
    public var insideTextAnchor: Shared.InsideTextAnchor? = nil

    /// Sets the angle of the tick labels with respect to the bar.
    /// 
    /// For example, a `tickangle` of -90 draws the tick labels vertically. With *auto* the texts may
    /// automatically be rotated to fit with the maximum size in bars.
    public var textAngle: Angle? = nil

    /// Sets the font used for `text`.
    public var textFont: Shared.VariableFont? = nil

    /// Sets the font used for `text` lying inside the bar.
    public var insideTextFont: Shared.VariableFont? = nil

    /// Sets the font used for `text` lying outside the bar.
    public var outsideTextFont: Shared.OutsideTextFont? = nil

    /// Constrain the size of text inside or outside a bar to be no larger than the bar itself.
    public var constrainText: Shared.ConstrainText? = nil

    /// Determines whether the text nodes are clipped about the subplot axes.
    /// 
    /// To show the text nodes above axis lines and tick labels, make sure to set `xaxis.layer` and
    /// `yaxis.layer` to *below traces*.
    public var clipOnAxis: Bool? = nil

    /// Sets the orientation of the bars.
    /// 
    /// With *v* (*h*), the value of the each bar spans along the vertical (horizontal).
    public var orientation: Shared.Orientation? = nil

    /// Sets where the bar base is drawn (in position axis units).
    /// 
    /// In *stack* or *relative* barmode, traces that set *base* will be excluded and drawn in *overlay*
    /// mode instead.
    public var base: Data<Anything>? = nil

    /// Shifts the position where the bar is drawn (in position axis units).
    /// 
    /// In *group* barmode, traces that set *offset* will be excluded and drawn in *overlay* mode
    /// instead.
    public var offset: Data<Double>? = nil

    /// Sets the bar width (in position axis units).
    public var width: Data<Double>? = nil

    public var marker: Shared.Marker? = nil

    /// Set several traces linked to the same position axis or matching axes to the same offsetgroup
    /// where bars of the same position coordinate will line up.
    public var offsetGroup: String? = nil

    /// Set several traces linked to the same position axis or matching axes to the same alignmentgroup.
    /// 
    /// This controls whether bars compute their positional range dependently or independently.
    public var alignmentGroup: String? = nil

    public struct Selected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of selected points.
            public var opacity: Double? = nil
        
            /// Sets the marker color of selected points.
            public var color: Color? = nil
        
            /// Creates `Marker` object with specified properties.
            /// 
            /// - Parameters:
            ///   - opacity: Sets the marker opacity of selected points.
            ///   - color: Sets the marker color of selected points.
            public init(opacity: Double? = nil, color: Color? = nil) {
                self.opacity = opacity
                self.color = color
            }
            
        }
        public var marker: Marker? = nil
    
        public struct TextFont: Encodable {
            /// Sets the text font color of selected points.
            public var color: Color? = nil
        
            /// Creates `TextFont` object with specified properties.
            /// 
            /// - Parameters:
            ///   - color: Sets the text font color of selected points.
            public init(color: Color? = nil) {
                self.color = color
            }
            
        }
        public var textFont: TextFont? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case marker
            case textFont = "textfont"
        }
        
        /// Creates `Selected` object with specified properties.
        public init(marker: Marker? = nil, textFont: TextFont? = nil) {
            self.marker = marker
            self.textFont = textFont
        }
        
    }
    public var selected: Selected? = nil

    public struct Unselected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of unselected points, applied only when a selection exists.
            public var opacity: Double? = nil
        
            /// Sets the marker color of unselected points, applied only when a selection exists.
            public var color: Color? = nil
        
            /// Creates `Marker` object with specified properties.
            /// 
            /// - Parameters:
            ///   - opacity: Sets the marker opacity of unselected points, applied only when a selection exists.
            ///   - color: Sets the marker color of unselected points, applied only when a selection exists.
            public init(opacity: Double? = nil, color: Color? = nil) {
                self.opacity = opacity
                self.color = color
            }
            
        }
        public var marker: Marker? = nil
    
        public struct TextFont: Encodable {
            /// Sets the text font color of unselected points, applied only when a selection exists.
            public var color: Color? = nil
        
            /// Creates `TextFont` object with specified properties.
            /// 
            /// - Parameters:
            ///   - color: Sets the text font color of unselected points, applied only when a selection exists.
            public init(color: Color? = nil) {
                self.color = color
            }
            
        }
        public var textFont: TextFont? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case marker
            case textFont = "textfont"
        }
        
        /// Creates `Unselected` object with specified properties.
        public init(marker: Marker? = nil, textFont: TextFont? = nil) {
            self.marker = marker
            self.textFont = textFont
        }
        
    }
    public var unselected: Unselected? = nil

    public var xError: Shared.Error? = nil

    public var yError: Shared.Error? = nil

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
        case selectedPoints = "selectedpoints"
        case hoverInfo = "hoverinfo"
        case hoverLabel = "hoverlabel"
        case stream
        case transforms
        case uiRevision = "uirevision"
        case x
        case x0
        case dx
        case y
        case y0
        case dy
        case text
        case textTemplate = "texttemplate"
        case hoverText = "hovertext"
        case hoverTemplate = "hovertemplate"
        case textPosition = "textposition"
        case insideTextAnchor = "insidetextanchor"
        case textAngle = "textangle"
        case textFont = "textfont"
        case insideTextFont = "insidetextfont"
        case outsideTextFont = "outsidetextfont"
        case constrainText = "constraintext"
        case clipOnAxis = "cliponaxis"
        case orientation
        case base
        case offset
        case width
        case marker
        case offsetGroup = "offsetgroup"
        case alignmentGroup = "alignmentgroup"
        case selected
        case unselected
        case xError = "error_x"
        case yError = "error_y"
        case xCalendar = "xcalendar"
        case yCalendar = "ycalendar"
        case xAxis = "xaxis"
        case yAxis = "yaxis"
    }
    
    /// Creates `Bar` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - x: Sets the x coordinates.
    ///   - y: Sets the y coordinates.
    ///   - text: Sets text elements associated with each (x,y) pair.
    ///   - hoverText: Sets hover text elements associated with each (x,y) pair.
    ///   - marker:
    public init(name: String? = nil, x: XData? = nil, y: YData? = nil, text: Data<String>? = nil,
            hoverText: Data<String>? = nil, marker: Shared.Marker? = nil) {
        self.name = name
        self.x = x
        self.y = y
        self.text = text
        self.hoverText = hoverText
        self.marker = marker
    }
    
    /// Creates `Bar` object with specified properties.
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
    ///   - selectedPoints: Array containing integer indices of selected points.
    ///   - hoverInfo: Determines which trace information appear on hover.
    ///   - hoverLabel:
    ///   - stream:
    ///   - transforms:
    ///   - uiRevision: Controls persistence of some user-driven changes to the trace: `constraintrange`
    ///   in `parcoords` traces, as well as some `editable: true` modifications such as `name` and
    ///   `colorbar.title`.
    ///   - x: Sets the x coordinates.
    ///   - x0: Alternate to `x`.
    ///   - dx: Sets the x coordinate step.
    ///   - y: Sets the y coordinates.
    ///   - y0: Alternate to `y`.
    ///   - dy: Sets the y coordinate step.
    ///   - text: Sets text elements associated with each (x,y) pair.
    ///   - textTemplate: Template string used for rendering the information text that appear on points.
    ///   - hoverText: Sets hover text elements associated with each (x,y) pair.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - textPosition: Specifies the location of the `text`.
    ///   - insideTextAnchor: Determines if texts are kept at center or start/end points in `textposition`
    ///   *inside* mode.
    ///   - textAngle: Sets the angle of the tick labels with respect to the bar.
    ///   - textFont: Sets the font used for `text`.
    ///   - insideTextFont: Sets the font used for `text` lying inside the bar.
    ///   - outsideTextFont: Sets the font used for `text` lying outside the bar.
    ///   - constrainText: Constrain the size of text inside or outside a bar to be no larger than the bar
    ///   itself.
    ///   - clipOnAxis: Determines whether the text nodes are clipped about the subplot axes.
    ///   - orientation: Sets the orientation of the bars.
    ///   - base: Sets where the bar base is drawn (in position axis units).
    ///   - offset: Shifts the position where the bar is drawn (in position axis units).
    ///   - width: Sets the bar width (in position axis units).
    ///   - marker:
    ///   - offsetGroup: Set several traces linked to the same position axis or matching axes to the same
    ///   offsetgroup where bars of the same position coordinate will line up.
    ///   - alignmentGroup: Set several traces linked to the same position axis or matching axes to the
    ///   same alignmentgroup.
    ///   - selected:
    ///   - unselected:
    ///   - xError:
    ///   - yError:
    ///   - xCalendar: Sets the calendar system to use with `x` date data.
    ///   - yCalendar: Sets the calendar system to use with `y` date data.
    ///   - xAxis: Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    ///   - yAxis: Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    public init(visible: Shared.Visible? = nil, showLegend: Bool? = nil, legendGroup: String? = nil,
            opacity: Double? = nil, name: String? = nil, uid: String? = nil, ids: [String]? = nil,
            customData: [String]? = nil, meta: Data<Anything>? = nil, selectedPoints: Anything? = nil,
            hoverInfo: Shared.HoverInfo? = nil, hoverLabel: Shared.HoverLabel? = nil, stream: Shared.Stream?
            = nil, transforms: [Shared.Transform]? = nil, uiRevision: Anything? = nil, x: XData? = nil, x0:
            Anything? = nil, dx: Double? = nil, y: YData? = nil, y0: Anything? = nil, dy: Double? = nil,
            text: Data<String>? = nil, textTemplate: Data<String>? = nil, hoverText: Data<String>? = nil,
            hoverTemplate: Data<String>? = nil, textPosition: Shared.AdjacentPosition? = nil,
            insideTextAnchor: Shared.InsideTextAnchor? = nil, textAngle: Angle? = nil, textFont:
            Shared.VariableFont? = nil, insideTextFont: Shared.VariableFont? = nil, outsideTextFont:
            Shared.OutsideTextFont? = nil, constrainText: Shared.ConstrainText? = nil, clipOnAxis: Bool? =
            nil, orientation: Shared.Orientation? = nil, base: Data<Anything>? = nil, offset: Data<Double>?
            = nil, width: Data<Double>? = nil, marker: Shared.Marker? = nil, offsetGroup: String? = nil,
            alignmentGroup: String? = nil, selected: Selected? = nil, unselected: Unselected? = nil, xError:
            Shared.Error? = nil, yError: Shared.Error? = nil, xCalendar: Shared.Calendar? = nil, yCalendar:
            Shared.Calendar? = nil, xAxis: Layout.XAxis = Layout.XAxis(uid: 1), yAxis: Layout.YAxis =
            Layout.YAxis(uid: 1)) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
        self.opacity = opacity
        self.name = name
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.selectedPoints = selectedPoints
        self.hoverInfo = hoverInfo
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.transforms = transforms
        self.uiRevision = uiRevision
        self.x = x
        self.x0 = x0
        self.dx = dx
        self.y = y
        self.y0 = y0
        self.dy = dy
        self.text = text
        self.textTemplate = textTemplate
        self.hoverText = hoverText
        self.hoverTemplate = hoverTemplate
        self.textPosition = textPosition
        self.insideTextAnchor = insideTextAnchor
        self.textAngle = textAngle
        self.textFont = textFont
        self.insideTextFont = insideTextFont
        self.outsideTextFont = outsideTextFont
        self.constrainText = constrainText
        self.clipOnAxis = clipOnAxis
        self.orientation = orientation
        self.base = base
        self.offset = offset
        self.width = width
        self.marker = marker
        self.offsetGroup = offsetGroup
        self.alignmentGroup = alignmentGroup
        self.selected = selected
        self.unselected = unselected
        self.xError = xError
        self.yError = yError
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
        try container.encodeIfPresent(selectedPoints, forKey: .selectedPoints)
        try container.encodeIfPresent(hoverInfo, forKey: .hoverInfo)
        try container.encodeIfPresent(hoverLabel, forKey: .hoverLabel)
        try container.encodeIfPresent(stream, forKey: .stream)
        try container.encodeIfPresent(transforms, forKey: .transforms)
        try container.encodeIfPresent(uiRevision, forKey: .uiRevision)
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
        try container.encodeIfPresent(textTemplate, forKey: .textTemplate)
        try container.encodeIfPresent(hoverText, forKey: .hoverText)
        try container.encodeIfPresent(hoverTemplate, forKey: .hoverTemplate)
        try container.encodeIfPresent(textPosition, forKey: .textPosition)
        try container.encodeIfPresent(insideTextAnchor, forKey: .insideTextAnchor)
        try container.encodeIfPresent(textAngle, forKey: .textAngle)
        try container.encodeIfPresent(textFont, forKey: .textFont)
        try container.encodeIfPresent(insideTextFont, forKey: .insideTextFont)
        try container.encodeIfPresent(outsideTextFont, forKey: .outsideTextFont)
        try container.encodeIfPresent(constrainText, forKey: .constrainText)
        try container.encodeIfPresent(clipOnAxis, forKey: .clipOnAxis)
        try container.encodeIfPresent(orientation, forKey: .orientation)
        try container.encodeIfPresent(base, forKey: .base)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(marker, forKey: .marker)
        try container.encodeIfPresent(offsetGroup, forKey: .offsetGroup)
        try container.encodeIfPresent(alignmentGroup, forKey: .alignmentGroup)
        try container.encodeIfPresent(selected, forKey: .selected)
        try container.encodeIfPresent(unselected, forKey: .unselected)
        try container.encodeIfPresent(xError, forKey: .xError)
        try container.encodeIfPresent(yError, forKey: .yError)
        try container.encodeIfPresent(xCalendar, forKey: .xCalendar)
        try container.encodeIfPresent(yCalendar, forKey: .yCalendar)
        try container.encode("x\(xAxis.uid)", forKey: .xAxis)
        try container.encode("y\(yAxis.uid)", forKey: .yAxis)
    }
}