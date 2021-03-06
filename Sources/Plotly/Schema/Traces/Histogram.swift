/// The sample data from which statistics are computed is set in `x` for vertically spanning
/// histograms and in `y` for horizontally spanning histograms.
/// 
/// Binning options are set `xbins` and `ybins` respectively if no aggregation data is provided.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#histogram), 
///   [JavaScript](https://plot.ly/javascript/reference/#histogram) or 
///   [R](https://plot.ly/r/reference/#histogram)
public struct Histogram<XData, YData>: Trace, XYSubplot where XData: Plotable, YData: Plotable {
    public let type: String = "histogram"

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

    /// Sets the sample data to be binned on the x axis.
    public var x: XData? = nil

    /// Sets the sample data to be binned on the y axis.
    public var y: YData? = nil

    /// Sets hover text elements associated with each bar.
    /// 
    /// If a single string, the same string appears over all bars. If an array of string, the items are
    /// mapped in order to the this trace's coordinates.
    public var text: Data<String>? = nil

    /// Same as `text`.
    public var hoverText: Data<String>? = nil

    /// Sets the orientation of the bars.
    /// 
    /// With *v* (*h*), the value of the each bar spans along the vertical (horizontal).
    public var orientation: Shared.Orientation? = nil

    /// Specifies the binning function used for this histogram trace.
    /// 
    /// If *count*, the histogram values are computed by counting the number of values lying inside each
    /// bin. If *sum*, *avg*, *min*, *max*, the histogram values are computed using the sum, the
    /// average, the minimum or the maximum of the values lying inside each bin respectively.
    public var binningFunction: Shared.BinningFunction? = nil

    /// Specifies the type of normalization used for this histogram trace.
    /// 
    /// If **, the span of each bar corresponds to the number of occurrences (i.e. the number of data
    /// points lying inside the bins). If *percent* / *probability*, the span of each bar corresponds to
    /// the percentage / fraction of occurrences with respect to the total number of sample points
    /// (here, the sum of all bin HEIGHTS equals 100% / 1). If *density*, the span of each bar
    /// corresponds to the number of occurrences in a bin divided by the size of the bin interval (here,
    /// the sum of all bin AREAS equals the total number of sample points). If *probability density*,
    /// the area of each bar corresponds to the probability that an event will fall into the
    /// corresponding bin (here, the sum of all bin AREAS equals 1).
    public var normalization: Shared.Normalization? = nil

    public struct Cumulative: Encodable {
        /// If true, display the cumulative distribution by summing the binned values.
        /// 
        /// Use the `direction` and `centralbin` attributes to tune the accumulation method. Note: in this
        /// mode, the *density* `histnorm` settings behave the same as their equivalents without *density*:
        /// ** and *density* both rise to the number of data points, and *probability* and *probability
        /// density* both rise to the number of sample points.
        public var enabled: Bool? = nil
    
        /// Only applies if cumulative is enabled.
        /// 
        /// If *increasing* (default) we sum all prior bins, so the result increases from left to right. If
        /// *decreasing* we sum later bins so the result decreases from left to right.
        public enum Direction: String, Encodable {
            case increasing
            case decreasing
        }
        /// Only applies if cumulative is enabled.
        /// 
        /// If *increasing* (default) we sum all prior bins, so the result increases from left to right. If
        /// *decreasing* we sum later bins so the result decreases from left to right.
        public var direction: Direction? = nil
    
        /// Only applies if cumulative is enabled.
        /// 
        /// Sets whether the current bin is included, excluded, or has half of its value included in the
        /// current cumulative value. *include* is the default for compatibility with various other tools,
        /// however it introduces a half-bin bias to the results. *exclude* makes the opposite half-bin
        /// bias, and *half* removes it.
        public enum CurrentBin: String, Encodable {
            case include
            case exclude
            case half
        }
        /// Only applies if cumulative is enabled.
        /// 
        /// Sets whether the current bin is included, excluded, or has half of its value included in the
        /// current cumulative value. *include* is the default for compatibility with various other tools,
        /// however it introduces a half-bin bias to the results. *exclude* makes the opposite half-bin
        /// bias, and *half* removes it.
        public var currentBin: CurrentBin? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case enabled
            case direction
            case currentBin = "currentbin"
        }
        
        /// Creates `Cumulative` object with specified properties.
        /// 
        /// - Parameters:
        ///   - enabled: If true, display the cumulative distribution by summing the binned values.
        ///   - direction: Only applies if cumulative is enabled.
        ///   - currentBin: Only applies if cumulative is enabled.
        public init(enabled: Bool? = nil, direction: Direction? = nil, currentBin: CurrentBin? = nil) {
            self.enabled = enabled
            self.direction = direction
            self.currentBin = currentBin
        }
        
    }
    public var cumulative: Cumulative? = nil

    /// Specifies the maximum number of desired bins.
    /// 
    /// This value will be used in an algorithm that will decide the optimal bin size such that the
    /// histogram best visualizes the distribution of the data. Ignored if `xbins.size` is provided.
    public var xNumBins: Int? = nil

    public var xBins: Shared.Bins? = nil

    /// Specifies the maximum number of desired bins.
    /// 
    /// This value will be used in an algorithm that will decide the optimal bin size such that the
    /// histogram best visualizes the distribution of the data. Ignored if `ybins.size` is provided.
    public var yNumBins: Int? = nil

    public var yBins: Shared.Bins? = nil

    /// Obsolete: since v1.42 each bin attribute is auto-determined separately and `autobinx` is not
    /// needed.
    /// 
    /// However, we accept `autobinx: true` or `false` and will update `xbins` accordingly before
    /// deleting `autobinx` from the trace.
    public var xAutoBin: Bool? = nil

    /// Obsolete: since v1.42 each bin attribute is auto-determined separately and `autobiny` is not
    /// needed.
    /// 
    /// However, we accept `autobiny: true` or `false` and will update `ybins` accordingly before
    /// deleting `autobiny` from the trace.
    public var yAutoBin: Bool? = nil

    /// Set a group of histogram traces which will have compatible bin settings.
    /// 
    /// Note that traces on the same subplot and with the same *orientation* under `barmode` *stack*,
    /// *relative* and *group* are forced into the same bingroup, Using `bingroup`, traces under
    /// `barmode` *overlay* and on different axes (of the same axis type) can have compatible bin
    /// settings. Note that histogram and histogram2d* trace can share the same `bingroup`
    public var binGroup: String? = nil

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
    /// true`) are available. variable `binNumber` Anything contained in tag `<extra>` is displayed in
    /// the secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box
    /// completely, use an empty tag `<extra></extra>`.
    public var hoverTemplate: Data<String>? = nil

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
        case y
        case text
        case hoverText = "hovertext"
        case orientation
        case binningFunction = "histfunc"
        case normalization = "histnorm"
        case cumulative
        case xNumBins = "nbinsx"
        case xBins = "xbins"
        case yNumBins = "nbinsy"
        case yBins = "ybins"
        case xAutoBin = "autobinx"
        case yAutoBin = "autobiny"
        case binGroup = "bingroup"
        case hoverTemplate = "hovertemplate"
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
    
    /// Creates `Histogram` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - x: Sets the sample data to be binned on the x axis.
    ///   - y: Sets the sample data to be binned on the y axis.
    ///   - text: Sets hover text elements associated with each bar.
    ///   - hoverText: Same as `text`.
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
    
    /// Creates `Histogram` object with specified properties.
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
    ///   - x: Sets the sample data to be binned on the x axis.
    ///   - y: Sets the sample data to be binned on the y axis.
    ///   - text: Sets hover text elements associated with each bar.
    ///   - hoverText: Same as `text`.
    ///   - orientation: Sets the orientation of the bars.
    ///   - binningFunction: Specifies the binning function used for this histogram trace.
    ///   - normalization: Specifies the type of normalization used for this histogram trace.
    ///   - cumulative:
    ///   - xNumBins: Specifies the maximum number of desired bins.
    ///   - xBins:
    ///   - yNumBins: Specifies the maximum number of desired bins.
    ///   - yBins:
    ///   - xAutoBin: Obsolete: since v1.42 each bin attribute is auto-determined separately and
    ///   `autobinx` is not needed.
    ///   - yAutoBin: Obsolete: since v1.42 each bin attribute is auto-determined separately and
    ///   `autobiny` is not needed.
    ///   - binGroup: Set a group of histogram traces which will have compatible bin settings.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
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
            = nil, transforms: [Shared.Transform]? = nil, uiRevision: Anything? = nil, x: XData? = nil, y:
            YData? = nil, text: Data<String>? = nil, hoverText: Data<String>? = nil, orientation:
            Shared.Orientation? = nil, binningFunction: Shared.BinningFunction? = nil, normalization:
            Shared.Normalization? = nil, cumulative: Cumulative? = nil, xNumBins: Int? = nil, xBins:
            Shared.Bins? = nil, yNumBins: Int? = nil, yBins: Shared.Bins? = nil, xAutoBin: Bool? = nil,
            yAutoBin: Bool? = nil, binGroup: String? = nil, hoverTemplate: Data<String>? = nil, marker:
            Shared.Marker? = nil, offsetGroup: String? = nil, alignmentGroup: String? = nil, selected:
            Selected? = nil, unselected: Unselected? = nil, xError: Shared.Error? = nil, yError:
            Shared.Error? = nil, xCalendar: Shared.Calendar? = nil, yCalendar: Shared.Calendar? = nil,
            xAxis: Layout.XAxis = Layout.XAxis(uid: 1), yAxis: Layout.YAxis = Layout.YAxis(uid: 1)) {
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
        self.y = y
        self.text = text
        self.hoverText = hoverText
        self.orientation = orientation
        self.binningFunction = binningFunction
        self.normalization = normalization
        self.cumulative = cumulative
        self.xNumBins = xNumBins
        self.xBins = xBins
        self.yNumBins = yNumBins
        self.yBins = yBins
        self.xAutoBin = xAutoBin
        self.yAutoBin = yAutoBin
        self.binGroup = binGroup
        self.hoverTemplate = hoverTemplate
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
        if let y = self.y {
            try y.encode(toPlotly: container.superEncoder(forKey: .y))
        }
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(hoverText, forKey: .hoverText)
        try container.encodeIfPresent(orientation, forKey: .orientation)
        try container.encodeIfPresent(binningFunction, forKey: .binningFunction)
        try container.encodeIfPresent(normalization, forKey: .normalization)
        try container.encodeIfPresent(cumulative, forKey: .cumulative)
        try container.encodeIfPresent(xNumBins, forKey: .xNumBins)
        try container.encodeIfPresent(xBins, forKey: .xBins)
        try container.encodeIfPresent(yNumBins, forKey: .yNumBins)
        try container.encodeIfPresent(yBins, forKey: .yBins)
        try container.encodeIfPresent(xAutoBin, forKey: .xAutoBin)
        try container.encodeIfPresent(yAutoBin, forKey: .yAutoBin)
        try container.encodeIfPresent(binGroup, forKey: .binGroup)
        try container.encodeIfPresent(hoverTemplate, forKey: .hoverTemplate)
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