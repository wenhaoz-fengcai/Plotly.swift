/// Use cone traces to visualize vector fields.  Specify a vector field using 6 1D arrays, 3 position arrays `x`, `y` and `z` and 3 vector component arrays `u`, `v`, `w`. The cones are drawn exactly at the positions given by `x`, `y` and `z`.
struct Cone: Encodable {
    /// Determines whether or not the color domain is computed with respect to the input data (here u/v/w norm) or the bounds set in `cmin` and `cmax`  Defaults to `false` when `cmin` and `cmax` are set by the user.
    var cauto: Bool?

    /// Adjusts the cone size scaling. The size of the cones is determined by their u/v/w norm multiplied a factor and `sizeref`. This factor (computed internally) corresponds to the minimum "time" to travel across two successive x/y/z positions at the average velocity of those two successive positions. All cones in a given trace use the same factor. With `sizemode` set to *scaled*, `sizeref` is unitless, its default value is *0.5* With `sizemode` set to *absolute*, `sizeref` has the same units as the u/v/w vector field, its the default value is half the sample's maximum vector norm.
    var sizeref: Double?

    /// Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).
    enum Visible: String, Encodable {
        case yes
        case no
        case legendonly
    }
    /// Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).
    var visible: Visible?

    /// Sets the x components of the vector field.
    var u: [Double]?

    /// Determines whether or not a colorbar is displayed for this trace.
    var showscale: Bool?

    /// Sets the upper bound of the color domain. Value should have the same units as u/v/w norm and if set, `cmin` must be set as well.
    var cmax: Double?

    /// Assigns extra data each datum. This may be useful when listening to hover, click and selection events. Note that, *scatter* traces also appends customdata items in the markers DOM elements
    var customdata: [Double]?

    /// Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`, `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app can add/remove traces before the end of the `data` array, such that the same trace has a different index, you can still preserve user-driven changes if you give each trace a `uid` that stays with it as it moves.
    var uirevision: Anything?

    /// Sets the trace name. The trace name appear as the legend item and on hover.
    var name: String?

    /// Sets a reference to a shared color axis. References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings for these shared color axes are set in the layout, under `layout.coloraxis`, `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
    var coloraxis: SubplotID?

    /// Sets the source reference on plot.ly for  x .
    var xsrc: String?

    /// 
    struct Stream: Encodable {
        /// The stream id number links a data trace on a plot with a stream. See https://plot.ly/settings for more details.
        var token: String?
    
        /// Sets the maximum number of points to keep on the plots from an incoming stream. If `maxpoints` is set to *50*, only the newest 50 points will be displayed on the plot.
        var maxpoints: Double?
    
    }
    /// 
    var stream: Stream?

    /// Sets the source reference on plot.ly for  v .
    var vsrc: String?

    /// Sets the lower bound of the color domain. Value should have the same units as u/v/w norm and if set, `cmax` must be set as well.
    var cmin: Double?

    /// Assigns id labels to each datum. These ids for object constancy of data points during animation. Should be an array of strings, not numbers or any other type.
    var ids: [Double]?

    /// Sets the opacity of the surface. Please note that in the case of using high `opacity` values for example a value greater than or equal to 0.5 on two surfaces (and 0.25 with four surfaces), an overlay of multiple transparent surfaces may not perfectly be sorted in depth by the webgl API. This behavior may be improved in the near future and is subject to change.
    var opacity: Double?

    /// Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}". https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variable `norm` Anything contained in tag `<extra>` is displayed in the secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag `<extra></extra>`.
    var hovertemplate: String?

    /// Sets the source reference on plot.ly for  meta .
    var metasrc: String?

    /// Sets the text elements associated with the cones. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.
    var text: String?

    /// Sets the source reference on plot.ly for  z .
    var zsrc: String?

    /// Sets the cones' anchor with respect to their x/y/z positions. Note that *cm* denote the cone's center of mass which corresponds to 1/4 from the tail to tip.
    enum Anchor: String, Encodable {
        case tip
        case tail
        case cm
        case center
    }
    /// Sets the cones' anchor with respect to their x/y/z positions. Note that *cm* denote the cone's center of mass which corresponds to 1/4 from the tail to tip.
    var anchor: Anchor?

    /// Sets a reference between this trace's 3D coordinate system and a 3D scene. If *scene* (the default value), the (x,y,z) coordinates refer to `layout.scene`. If *scene2*, the (x,y,z) coordinates refer to `layout.scene2`, and so on.
    var scene: SubplotID?

    /// Sets the z components of the vector field.
    var w: [Double]?

    /// Sets the mid-point of the color domain by scaling `cmin` and/or `cmax` to be equidistant to this point. Value should have the same units as u/v/w norm. Has no effect when `cauto` is `false`.
    var cmid: Double?

    /// Sets the colorscale. The colorscale must be an array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale in color space, use`cmin` and `cmax`. Alternatively, `colorscale` may be a palette name string of the following list: Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
    var colorscale: ColorScale?

    /// Determines whether `sizeref` is set as a *scaled* (i.e unitless) scalar (normalized by the max u/v/w norm in the vector field) or as *absolute* value (in the same units as the vector field).
    enum Sizemode: String, Encodable {
        case scaled
        case absolute
    }
    /// Determines whether `sizeref` is set as a *scaled* (i.e unitless) scalar (normalized by the max u/v/w norm in the vector field) or as *absolute* value (in the same units as the vector field).
    var sizemode: Sizemode?

    /// Same as `text`.
    var hovertext: String?

    /// Sets the source reference on plot.ly for  hovertext .
    var hovertextsrc: String?

    /// Sets the y components of the vector field.
    var v: [Double]?

    /// Sets the y coordinates of the vector field and of the displayed cones.
    var y: [Double]?

    /// Sets the source reference on plot.ly for  u .
    var usrc: String?

    /// Reverses the color mapping if true. If true, `cmin` will correspond to the last color in the array and `cmax` will correspond to the first color.
    var reversescale: Bool?

    /// Sets the source reference on plot.ly for  ids .
    var idssrc: String?

    /// 
    struct Lighting: Encodable {
        /// Represents the level that incident rays are reflected in a single direction, causing shine.
        var specular: Double?
    
        /// Epsilon for face normals calculation avoids math issues arising from degenerate geometry.
        var facenormalsepsilon: Double?
    
        /// Alters specular reflection; the rougher the surface, the wider and less contrasty the shine.
        var roughness: Double?
    
        /// Represents the extent that incident rays are reflected in a range of angles.
        var diffuse: Double?
    
        /// Ambient light increases overall color visibility but can wash out the image.
        var ambient: Double?
    
        /// Epsilon for vertex normals calculation avoids math issues arising from degenerate geometry.
        var vertexnormalsepsilon: Double?
    
        /// Represents the reflectance as a dependency of the viewing angle; e.g. paper is reflective when viewing it from the edge of the paper (almost 90 degrees), causing shine.
        var fresnel: Double?
    
    }
    /// 
    var lighting: Lighting?

    /// Sets the source reference on plot.ly for  y .
    var ysrc: String?

    /// Assigns extra meta information associated with this trace that can be used in various text attributes. Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text` `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the index or key of the `meta` item in question. To access trace `meta` in layout attributes, use `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    var meta: Anything?

    /// Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.
    var uid: String?

    /// 
    struct Colorbar: Encodable {
        /// Determines whether this color bar's thickness (i.e. the measure in the constant color direction) is set in units of plot *fraction* or in *pixels*. Use `thickness` to set the value.
        enum Thicknessmode: String, Encodable {
            case fraction
            case pixels
        }
        /// Determines whether this color bar's thickness (i.e. the measure in the constant color direction) is set in units of plot *fraction* or in *pixels*. Use `thickness` to set the value.
        var thicknessmode: Thicknessmode?
    
        /// Sets the y position of the color bar (in plot fraction).
        var y: Double?
    
        /// Sets the amount of padding (in px) along the y direction.
        var ypad: Double?
    
        /// Sets the width (in px) of the axis line.
        var outlinewidth: Double?
    
        /// Sets the tick label formatting rule using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format And for dates see: https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format We add one item to d3's date formatter: *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*
        var tickformat: String?
    
        /// Sets the tick color.
        var tickcolor: Color?
    
        /// Sets the x position of the color bar (in plot fraction).
        var x: Double?
    
        /// Sets the axis line color.
        var outlinecolor: Color?
    
        /// If *all*, all tick labels are displayed with a prefix. If *first*, only the first tick is displayed with a prefix. If *last*, only the last tick is displayed with a suffix. If *none*, tick prefixes are hidden.
        enum Showtickprefix: String, Encodable {
            case all
            case first
            case last
            case none
        }
        /// If *all*, all tick labels are displayed with a prefix. If *first*, only the first tick is displayed with a prefix. If *last*, only the last tick is displayed with a suffix. If *none*, tick prefixes are hidden.
        var showtickprefix: Showtickprefix?
    
        /// 
        struct _Deprecated: Encodable {
            /// Deprecated in favor of color bar's `title.side`.
            enum Titleside: String, Encodable {
                case right
                case top
                case bottom
            }
            /// Deprecated in favor of color bar's `title.side`.
            var titleside: Titleside?
        
            /// Deprecated in favor of color bar's `title.text`. Note that value of color bar's `title` is no longer a simple *string* but a set of sub-attributes.
            var title: String?
        
            /// Deprecated in favor of color bar's `title.font`.
            struct Titlefont: Encodable {
                /// 
                var size: Double?
            
                /// HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.
                var family: String?
            
                /// 
                var color: Color?
            
            }
            /// Deprecated in favor of color bar's `title.font`.
            var titlefont: Titlefont?
        
        }
        /// 
        var _deprecated: _Deprecated?
    
        /// Sets a tick label suffix.
        var ticksuffix: String?
    
        /// Sets the source reference on plot.ly for  ticktext .
        var ticktextsrc: String?
    
        /// Sets the tick width (in px).
        var tickwidth: Double?
    
        /// Determines whether this color bar's length (i.e. the measure in the color variation direction) is set in units of plot *fraction* or in *pixels. Use `len` to set the value.
        enum Lenmode: String, Encodable {
            case fraction
            case pixels
        }
        /// Determines whether this color bar's length (i.e. the measure in the color variation direction) is set in units of plot *fraction* or in *pixels. Use `len` to set the value.
        var lenmode: Lenmode?
    
        /// Determines whether ticks are drawn or not. If **, this axis' ticks are not drawn. If *outside* (*inside*), this axis' are drawn outside (inside) the axis lines.
        enum Ticks: String, Encodable {
            case outside
            case inside
            case none
        }
        /// Determines whether ticks are drawn or not. If **, this axis' ticks are not drawn. If *outside* (*inside*), this axis' are drawn outside (inside) the axis lines.
        var ticks: Ticks?
    
        /// If "true", even 4-digit integers are separated
        var separatethousands: Bool?
    
        /// Sets the color of padded area.
        var bgcolor: Color?
    
        /// Sets a tick label prefix.
        var tickprefix: String?
    
        /// Sets the thickness of the color bar This measure excludes the size of the padding, ticks and labels.
        var thickness: Double?
    
        /// Sets the tick length (in px).
        var ticklen: Double?
    
        /// Sets the length of the color bar This measure excludes the padding of both ends. That is, the color bar length is this length minus the padding on both ends.
        var len: Double?
    
        /// Same as `showtickprefix` but for tick suffixes.
        enum Showticksuffix: String, Encodable {
            case all
            case first
            case last
            case none
        }
        /// Same as `showtickprefix` but for tick suffixes.
        var showticksuffix: Showticksuffix?
    
        /// Sets the axis line color.
        var bordercolor: Color?
    
        /// Sets the values at which ticks on this axis appear. Only has an effect if `tickmode` is set to *array*. Used with `ticktext`.
        var tickvals: [Double]?
    
        /// Determines whether or not the tick labels are drawn.
        var showticklabels: Bool?
    
        /// Sets the placement of the first tick on this axis. Use with `dtick`. If the axis `type` is *log*, then you must take the log of your starting tick (e.g. to set the starting tick to 100, set the `tick0` to 2) except when `dtick`=*L<f>* (see `dtick` for more info). If the axis `type` is *date*, it should be a date string, like date data. If the axis `type` is *category*, it should be a number, using the scale where each category is assigned a serial number from zero in the order it appears.
        var tick0: Anything?
    
        /// Sets the color bar's tick label font
        struct Tickfont: Encodable {
            /// 
            var size: Double?
        
            /// HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.
            var family: String?
        
            /// 
            var color: Color?
        
        }
        /// Sets the color bar's tick label font
        var tickfont: Tickfont?
    
        /// Sets the angle of the tick labels with respect to the horizontal. For example, a `tickangle` of -90 draws the tick labels vertically.
        var tickangle: Angle?
    
        /// Sets the step in-between ticks on this axis. Use with `tick0`. Must be a positive number, or special strings available to *log* and *date* axes. If the axis `type` is *log*, then ticks are set every 10^(n*dtick) where n is the tick number. For example, to set a tick mark at 1, 10, 100, 1000, ... set dtick to 1. To set tick marks at 1, 100, 10000, ... set dtick to 2. To set tick marks at 1, 5, 25, 125, 625, 3125, ... set dtick to log_10(5), or 0.69897000433. *log* has several special values; *L<f>*, where `f` is a positive number, gives ticks linearly spaced in value (but not position). For example `tick0` = 0.1, `dtick` = *L0.5* will put ticks at 0.1, 0.6, 1.1, 1.6 etc. To show powers of 10 plus small digits between, use *D1* (all digits) or *D2* (only 2 and 5). `tick0` is ignored for *D1* and *D2*. If the axis `type` is *date*, then you must convert the time to milliseconds. For example, to set the interval between ticks to one day, set `dtick` to 86400000.0. *date* also has special values *M<n>* gives ticks spaced by a number of months. `n` must be a positive integer. To set ticks on the 15th of every third month, set `tick0` to *2000-01-15* and `dtick` to *M3*. To set ticks every 4 years, set `dtick` to *M48*
        var dtick: Anything?
    
        /// If *all*, all exponents are shown besides their significands. If *first*, only the exponent of the first tick is shown. If *last*, only the exponent of the last tick is shown. If *none*, no exponents appear.
        enum Showexponent: String, Encodable {
            case all
            case first
            case last
            case none
        }
        /// If *all*, all exponents are shown besides their significands. If *first*, only the exponent of the first tick is shown. If *last*, only the exponent of the last tick is shown. If *none*, no exponents appear.
        var showexponent: Showexponent?
    
        /// Sets the width (in px) or the border enclosing this color bar.
        var borderwidth: Double?
    
        /// Determines a formatting rule for the tick exponents. For example, consider the number 1,000,000,000. If *none*, it appears as 1,000,000,000. If *e*, 1e+9. If *E*, 1E+9. If *power*, 1x10^9 (with 9 in a super script). If *SI*, 1G. If *B*, 1B.
        enum Exponentformat: String, Encodable {
            case none
            case e
            case E
            case power
            case SI
            case B
        }
        /// Determines a formatting rule for the tick exponents. For example, consider the number 1,000,000,000. If *none*, it appears as 1,000,000,000. If *e*, 1e+9. If *E*, 1E+9. If *power*, 1x10^9 (with 9 in a super script). If *SI*, 1G. If *B*, 1B.
        var exponentformat: Exponentformat?
    
        /// 
        struct Tickformatstops: Encodable {
            /// 
            struct Items: Encodable {
                /// 
                struct Tickformatstop: Encodable {
                    /// string - dtickformat for described zoom level, the same as *tickformat*
                    var value: String?
                
                    /// range [*min*, *max*], where *min*, *max* - dtick values which describe some zoom level, it is possible to omit *min* or *max* value by passing *null*
                    var dtickrange: InfoArray?
                
                    /// Used to refer to a named item in this array in the template. Named items from the template will be created even without a matching item in the input figure, but you can modify one by making an item with `templateitemname` matching its `name`, alongside your modifications (including `visible: false` or `enabled: false` to hide it). If there is no template or no matching item, this item will be hidden unless you explicitly show it with `visible: true`.
                    var templateitemname: String?
                
                    /// Determines whether or not this stop is used. If `false`, this stop is ignored even within its `dtickrange`.
                    var enabled: Bool?
                
                    /// When used in a template, named items are created in the output figure in addition to any items the figure already has in this array. You can modify these items in the output figure by making your own item with `templateitemname` matching this `name` alongside your modifications (including `visible: false` or `enabled: false` to hide it). Has no effect outside of a template.
                    var name: String?
                
                }
                /// 
                var tickformatstop: Tickformatstop?
            
            }
            /// 
            var items: Items?
        
        }
        /// 
        var tickformatstops: Tickformatstops?
    
        /// Specifies the maximum number of ticks for the particular axis. The actual number of ticks will be chosen automatically to be less than or equal to `nticks`. Has an effect only if `tickmode` is set to *auto*.
        var nticks: Int?
    
        /// 
        struct Title: Encodable {
            /// Sets this color bar's title font. Note that the title's font used to be set by the now deprecated `titlefont` attribute.
            struct Font: Encodable {
                /// 
                var size: Double?
            
                /// HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.
                var family: String?
            
                /// 
                var color: Color?
            
            }
            /// Sets this color bar's title font. Note that the title's font used to be set by the now deprecated `titlefont` attribute.
            var font: Font?
        
            /// Sets the title of the color bar. Note that before the existence of `title.text`, the title's contents used to be defined as the `title` attribute itself. This behavior has been deprecated.
            var text: String?
        
            /// Determines the location of color bar's title with respect to the color bar. Note that the title's location used to be set by the now deprecated `titleside` attribute.
            enum Side: String, Encodable {
                case right
                case top
                case bottom
            }
            /// Determines the location of color bar's title with respect to the color bar. Note that the title's location used to be set by the now deprecated `titleside` attribute.
            var side: Side?
        
        }
        /// 
        var title: Title?
    
        /// Sets the source reference on plot.ly for  tickvals .
        var tickvalssrc: String?
    
        /// Sets this color bar's horizontal position anchor. This anchor binds the `x` position to the *left*, *center* or *right* of the color bar.
        enum Xanchor: String, Encodable {
            case left
            case center
            case right
        }
        /// Sets this color bar's horizontal position anchor. This anchor binds the `x` position to the *left*, *center* or *right* of the color bar.
        var xanchor: Xanchor?
    
        /// Sets the text displayed at the ticks position via `tickvals`. Only has an effect if `tickmode` is set to *array*. Used with `tickvals`.
        var ticktext: [Double]?
    
        /// Sets this color bar's vertical position anchor This anchor binds the `y` position to the *top*, *middle* or *bottom* of the color bar.
        enum Yanchor: String, Encodable {
            case top
            case middle
            case bottom
        }
        /// Sets this color bar's vertical position anchor This anchor binds the `y` position to the *top*, *middle* or *bottom* of the color bar.
        var yanchor: Yanchor?
    
        /// Sets the amount of padding (in px) along the x direction.
        var xpad: Double?
    
        /// Sets the tick mode for this axis. If *auto*, the number of ticks is set via `nticks`. If *linear*, the placement of the ticks is determined by a starting position `tick0` and a tick step `dtick` (*linear* is the default value if `tick0` and `dtick` are provided). If *array*, the placement of the ticks is set via `tickvals` and the tick text is `ticktext`. (*array* is the default value if `tickvals` is provided).
        enum Tickmode: String, Encodable {
            case auto
            case linear
            case array
        }
        /// Sets the tick mode for this axis. If *auto*, the number of ticks is set via `nticks`. If *linear*, the placement of the ticks is determined by a starting position `tick0` and a tick step `dtick` (*linear* is the default value if `tick0` and `dtick` are provided). If *array*, the placement of the ticks is set via `tickvals` and the tick text is `ticktext`. (*array* is the default value if `tickvals` is provided).
        var tickmode: Tickmode?
    
    }
    /// 
    var colorbar: Colorbar?

    /// Sets the source reference on plot.ly for  w .
    var wsrc: String?

    /// Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.
    struct Hoverinfo: OptionSet, Encodable {
        let rawValue: Int
    
        static let x = Hoverinfo(rawValue: 1 << 0)
        static let y = Hoverinfo(rawValue: 1 << 1)
        static let z = Hoverinfo(rawValue: 1 << 2)
        static let u = Hoverinfo(rawValue: 1 << 3)
        static let v = Hoverinfo(rawValue: 1 << 4)
        static let w = Hoverinfo(rawValue: 1 << 5)
        static let norm = Hoverinfo(rawValue: 1 << 6)
        static let text = Hoverinfo(rawValue: 1 << 7)
        static let name = Hoverinfo(rawValue: 1 << 8)
    
        init(rawValue: Int) { self.rawValue = rawValue }
    
        func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["x"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["y"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["z"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["u"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["v"] }
            if (self.rawValue & 1 << 5) != 0 { options += ["w"] }
            if (self.rawValue & 1 << 6) != 0 { options += ["norm"] }
            if (self.rawValue & 1 << 7) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 8) != 0 { options += ["name"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.
    var hoverinfo: Hoverinfo?

    /// Sets the x coordinates of the vector field and of the displayed cones.
    var x: [Double]?

    /// Sets the source reference on plot.ly for  customdata .
    var customdatasrc: String?

    /// Sets the source reference on plot.ly for  hovertemplate .
    var hovertemplatesrc: String?

    /// 
    struct Lightposition: Encodable {
        /// Numeric vector, representing the X coordinate for each vertex.
        var x: Double?
    
        /// Numeric vector, representing the Y coordinate for each vertex.
        var y: Double?
    
        /// Numeric vector, representing the Z coordinate for each vertex.
        var z: Double?
    
    }
    /// 
    var lightposition: Lightposition?

    /// Sets the z coordinates of the vector field and of the displayed cones.
    var z: [Double]?

    /// Sets the source reference on plot.ly for  hoverinfo .
    var hoverinfosrc: String?

    /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette determined by `colorscale`. In case `colorscale` is unspecified or `autocolorscale` is true, the default  palette will be chosen according to whether numbers in the `color` array are all positive, all negative or mixed.
    var autocolorscale: Bool?

    /// Sets the source reference on plot.ly for  text .
    var textsrc: String?

    /// 
    struct Hoverlabel: Encodable {
        /// Sets the font used in hover labels.
        struct Font: Encodable {
            /// HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.
            var family: String?
        
            /// 
            var color: Color?
        
            /// Sets the source reference on plot.ly for  color .
            var colorsrc: String?
        
            /// Sets the source reference on plot.ly for  family .
            var familysrc: String?
        
            /// Sets the source reference on plot.ly for  size .
            var sizesrc: String?
        
            /// 
            var size: Double?
        
        }
        /// Sets the font used in hover labels.
        var font: Font?
    
        /// Sets the horizontal alignment of the text content within hover label box. Has an effect only if the hover label text spans more two or more lines
        enum Align: String, Encodable {
            case left
            case right
            case auto
        }
        /// Sets the horizontal alignment of the text content within hover label box. Has an effect only if the hover label text spans more two or more lines
        var align: Align?
    
        /// Sets the background color of the hover labels for this trace
        var bgcolor: Color?
    
        /// Sets the source reference on plot.ly for  namelength .
        var namelengthsrc: String?
    
        /// Sets the source reference on plot.ly for  align .
        var alignsrc: String?
    
        /// Sets the default length (in number of characters) of the trace name in the hover labels for all traces. -1 shows the whole name regardless of length. 0-3 shows the first 0-3 characters, and an integer >3 will show the whole name if it is less than that many characters, but if it is longer, will truncate to `namelength - 3` characters and add an ellipsis.
        var namelength: Int?
    
        /// Sets the border color of the hover labels for this trace.
        var bordercolor: Color?
    
        /// Sets the source reference on plot.ly for  bgcolor .
        var bgcolorsrc: String?
    
        /// Sets the source reference on plot.ly for  bordercolor .
        var bordercolorsrc: String?
    
    }
    /// 
    var hoverlabel: Hoverlabel?

}