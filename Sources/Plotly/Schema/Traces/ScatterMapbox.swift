/// The data visualized as scatter point, lines or marker symbols on a Mapbox GL geographic map is provided by longitude/latitude pairs in `lon` and `lat`.
public struct ScatterMapbox: Trace {
    public let type: String = "scattermapbox"

    public let animatable: Bool = false

    public var visible: Visible0?

    /// Determines whether or not an item corresponding to this trace is shown in the legend.
    public var showLegend: Bool?

    /// Sets the legend group for this trace. 
    ///
    /// Traces part of the same legend group hide/show at the same time when toggling legend items.
    public var legendGroup: String?

    /// Sets the opacity of the trace.
    public var opacity: Double?

    /// Sets the trace name. 
    ///
    /// The trace name appear as the legend item and on hover.
    public var name: String?

    /// Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.
    public var uid: String?

    /// Assigns id labels to each datum. 
    ///
    /// These ids for object constancy of data points during animation. Should be an array of strings,
    /// not numbers or any other type.
    public var ids: [Double]?

    /// Assigns extra data each datum. 
    ///
    /// This may be useful when listening to hover, click and selection events. Note that, *scatter*
    /// traces also appends customdata items in the markers DOM elements
    public var customData: [Double]?

    /// Assigns extra meta information associated with this trace that can be used in various text attributes. 
    ///
    /// Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text`
    /// `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the
    /// trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the
    /// index or key of the `meta` item in question. To access trace `meta` in layout attributes, use
    /// `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    public var meta: Anything?

    /// Array containing integer indices of selected points. 
    ///
    /// Has an effect only for traces that support selections. Note that an empty array means an empty
    /// selection where the `unselected` are turned on for all points, whereas, any other non-array
    /// values means no selection all where the `selected` and `unselected` styles have no effect.
    public var selectedPoints: Anything?

    public var hoverLabel: HoverLabel1?

    public var stream: Stream0?

    public var transforms: TickFormatStops0?

    /// Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. 
    ///
    /// Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are
    /// controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`,
    /// `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible
    /// with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are
    /// tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app
    /// can add/remove traces before the end of the `data` array, such that the same trace has a
    /// different index, you can still preserve user-driven changes if you give each trace a `uid` that
    /// stays with it as it moves.
    public var uiRevision: Anything?

    /// Sets the longitude coordinates (in degrees East).
    public var longitude: [Double]?

    /// Sets the latitude coordinates (in degrees North).
    public var latitude: [Double]?

    public var mode: Mode0?

    /// Sets text elements associated with each (lon,lat) pair If a single string, the same string appears over all the data points. 
    ///
    /// If an array of string, the items are mapped in order to the this trace's (lon,lat) coordinates.
    /// If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be
    /// seen in the hover labels.
    public var text: String?

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
    /// `arrayOk: true`) are available. variables `lat`, `lon` and `text`.
    public var textTemplate: String?

    /// Sets hover text elements associated with each (lon,lat) pair If a single string, the same string appears over all the data points. 
    ///
    /// If an array of string, the items are mapped in order to the this trace's (lon,lat) coordinates.
    /// To be seen, trace `hoverinfo` must contain a *text* flag.
    public var hoverText: String?

    public var line: Line3?

    /// Determines whether or not gaps (i.e. 
    ///
    /// {nan} or missing values) in the provided data arrays are connected.
    public var connectGaps: Bool?

    /// - traces/scattermapbox/attributes/marker
    public struct Marker: Encodable {
        /// Sets the marker symbol. 
        ///
        /// Full list: https://www.mapbox.com/maki-icons/ Note that the array `marker.color` and
        /// `marker.size` are only available for *circle* symbols.
        public var symbol: String?
    
        /// Sets the marker opacity.
        public var opacity: Double?
    
        /// Sets the marker size (in px).
        public var size: Double?
    
        /// Has an effect only if `marker.size` is set to a numerical array. 
        ///
        /// Sets the scale factor used to determine the rendered size of marker points. Use with `sizemin`
        /// and `sizemode`.
        public var sizeReference: Double?
    
        /// Has an effect only if `marker.size` is set to a numerical array. 
        ///
        /// Sets the minimum size (in px) of the rendered marker points.
        public var sizeMin: Double?
    
        public var sizeMode: SizeMode0?
    
        /// Sets themarkercolor. 
        ///
        /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
        /// relative to the max and min values of the array or relative to `marker.cmin` and `marker.cmax`
        /// if set.
        public var color: Color?
    
        /// Determines whether or not the color domain is computed with respect to the input data (here in `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax`  Has an effect only if in `marker.color`is set to a numerical array. 
        ///
        /// Defaults to `false` when `marker.cmin` and `marker.cmax` are set by the user.
        public var cAuto: Bool?
    
        /// Sets the lower bound of the color domain. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmax` must be set as well.
        public var cMin: Double?
    
        /// Sets the upper bound of the color domain. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmin` must be set as well.
        public var cMax: Double?
    
        /// Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax` to be equidistant to this point. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color`. Has no effect when `marker.cauto` is `false`.
        public var cMiddle: Double?
    
        /// Sets the colorscale. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array. The colorscale must be an
        /// array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named
        /// color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For
        /// example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale
        /// in color space, use`marker.cmin` and `marker.cmax`. Alternatively, `colorscale` may be a palette
        /// name string of the following list:
        /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
        public var colorScale: ColorScale?
    
        /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette determined by `marker.colorscale`. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array. In case `colorscale` is
        /// unspecified or `autocolorscale` is true, the default palette will be chosen according to whether
        /// numbers in the `color` array are all positive, all negative or mixed.
        public var autoColorScale: Bool?
    
        /// Reverses the color mapping if true. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array. If true, `marker.cmin` will
        /// correspond to the last color in the array and `marker.cmax` will correspond to the first color.
        public var reverseScale: Bool?
    
        /// Determines whether or not a colorbar is displayed for this trace. 
        ///
        /// Has an effect only if in `marker.color`is set to a numerical array.
        public var showScale: Bool?
    
        public var colorBar: ColorBar0?
    
        /// Sets a reference to a shared color axis. 
        ///
        /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
        /// for these shared color axes are set in the layout, under `layout.coloraxis`,
        /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
        public var colorAxis: SubPlotID?
    
        /// Sets the source reference on plot.ly for  symbol .
        public var symbolSource: String?
    
        /// Sets the source reference on plot.ly for  opacity .
        public var opacitySource: String?
    
        /// Sets the source reference on plot.ly for  size .
        public var sizeSource: String?
    
        /// Sets the source reference on plot.ly for  color .
        public var colorSource: String?
    
        public init(symbol: String? = nil, opacity: Double? = nil, size: Double? = nil, sizeReference: Double? = nil, sizeMin: Double? = nil, sizeMode: SizeMode0? = nil, color: Color? = nil, cAuto: Bool? = nil, cMin: Double? = nil, cMax: Double? = nil, cMiddle: Double? = nil, colorScale: ColorScale? = nil, autoColorScale: Bool? = nil, reverseScale: Bool? = nil, showScale: Bool? = nil, colorBar: ColorBar0? = nil, colorAxis: SubPlotID? = nil, symbolSource: String? = nil, opacitySource: String? = nil, sizeSource: String? = nil, colorSource: String? = nil) {
            self.symbol = symbol
            self.opacity = opacity
            self.size = size
            self.sizeReference = sizeReference
            self.sizeMin = sizeMin
            self.sizeMode = sizeMode
            self.color = color
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
            self.symbolSource = symbolSource
            self.opacitySource = opacitySource
            self.sizeSource = sizeSource
            self.colorSource = colorSource
        }
    }
    public var marker: Marker?

    public var fill: Fill2?

    /// Sets the fill color. 
    ///
    /// Defaults to a half-transparent variant of the line color, marker color, or marker line color,
    /// whichever is available.
    public var fillColor: Color?

    public var textFont: Font0?

    public var textPosition: TextPosition0?

    /// Determines if this scattermapbox trace's layers are to be inserted before the layer with the specified ID. 
    ///
    /// By default, scattermapbox layers are inserted above all the base layers. To place the
    /// scattermapbox layers above every other layer, set `below` to *''*.
    public var below: String?

    public var selected: Selected1?

    public var unselected: Selected1?

    /// Determines which trace information appear on hover. 
    ///
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    /// - traces/scattermapbox/attributes/hoverinfo
    public struct HoverInfo: OptionSet, Encodable {
        public let rawValue: Int
    
        public static let longitude = HoverInfo(rawValue: 1 << 0)
        public static let latitude = HoverInfo(rawValue: 1 << 1)
        public static let text = HoverInfo(rawValue: 1 << 2)
        public static let name = HoverInfo(rawValue: 1 << 3)
        public static let all = HoverInfo(rawValue: 1 << 4)
        public static let none = HoverInfo(rawValue: 1 << 5)
        public static let skip = HoverInfo(rawValue: 1 << 6)
    
        public init(rawValue: Int) { self.rawValue = rawValue }
    
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["lon"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["lat"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["name"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["all"] }
            if (self.rawValue & 1 << 5) != 0 { options += ["none"] }
            if (self.rawValue & 1 << 6) != 0 { options += ["skip"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    public var hoverInfo: HoverInfo?

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
    public var hoverTemplate: String?

    /// Sets a reference between this trace's data coordinates and a mapbox subplot. 
    ///
    /// If *mapbox* (the default value), the data refer to `layout.mapbox`. If *mapbox2*, the data refer
    /// to `layout.mapbox2`, and so on.
    public var subPlot: SubPlotID?

    /// Sets the source reference on plot.ly for  ids .
    public var idsSource: String?

    /// Sets the source reference on plot.ly for  customdata .
    public var customDataSource: String?

    /// Sets the source reference on plot.ly for  meta .
    public var metaSource: String?

    /// Sets the source reference on plot.ly for  lon .
    public var longitudeSource: String?

    /// Sets the source reference on plot.ly for  lat .
    public var latitudeSource: String?

    /// Sets the source reference on plot.ly for  text .
    public var textSource: String?

    /// Sets the source reference on plot.ly for  texttemplate .
    public var textTemplateSource: String?

    /// Sets the source reference on plot.ly for  hovertext .
    public var hoverTextSource: String?

    /// Sets the source reference on plot.ly for  hoverinfo .
    public var hoverInfoSource: String?

    /// Sets the source reference on plot.ly for  hovertemplate .
    public var hoverTemplateSource: String?

    public init(visible: Visible0? = nil, showLegend: Bool? = nil, legendGroup: String? = nil, opacity: Double? = nil, name: String? = nil, uid: String? = nil, ids: [Double]? = nil, customData: [Double]? = nil, meta: Anything? = nil, selectedPoints: Anything? = nil, hoverLabel: HoverLabel1? = nil, stream: Stream0? = nil, transforms: TickFormatStops0? = nil, uiRevision: Anything? = nil, longitude: [Double]? = nil, latitude: [Double]? = nil, mode: Mode0? = nil, text: String? = nil, textTemplate: String? = nil, hoverText: String? = nil, line: Line3? = nil, connectGaps: Bool? = nil, marker: Marker? = nil, fill: Fill2? = nil, fillColor: Color? = nil, textFont: Font0? = nil, textPosition: TextPosition0? = nil, below: String? = nil, selected: Selected1? = nil, unselected: Selected1? = nil, hoverInfo: HoverInfo? = nil, hoverTemplate: String? = nil, subPlot: SubPlotID? = nil, idsSource: String? = nil, customDataSource: String? = nil, metaSource: String? = nil, longitudeSource: String? = nil, latitudeSource: String? = nil, textSource: String? = nil, textTemplateSource: String? = nil, hoverTextSource: String? = nil, hoverInfoSource: String? = nil, hoverTemplateSource: String? = nil) {
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
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.transforms = transforms
        self.uiRevision = uiRevision
        self.longitude = longitude
        self.latitude = latitude
        self.mode = mode
        self.text = text
        self.textTemplate = textTemplate
        self.hoverText = hoverText
        self.line = line
        self.connectGaps = connectGaps
        self.marker = marker
        self.fill = fill
        self.fillColor = fillColor
        self.textFont = textFont
        self.textPosition = textPosition
        self.below = below
        self.selected = selected
        self.unselected = unselected
        self.hoverInfo = hoverInfo
        self.hoverTemplate = hoverTemplate
        self.subPlot = subPlot
        self.idsSource = idsSource
        self.customDataSource = customDataSource
        self.metaSource = metaSource
        self.longitudeSource = longitudeSource
        self.latitudeSource = latitudeSource
        self.textSource = textSource
        self.textTemplateSource = textTemplateSource
        self.hoverTextSource = hoverTextSource
        self.hoverInfoSource = hoverInfoSource
        self.hoverTemplateSource = hoverTemplateSource
    }
}