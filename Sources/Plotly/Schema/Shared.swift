public struct Shared {
    
    // MARK: - Enums

    /// Sets the title's horizontal alignment with respect to its x position.
    /// 
    /// *left* means that the title starts at x, *right* means that the title ends at x and *center*
    /// means that the title's center is at x. *auto* divides `xref` by three and calculates the
    /// `xanchor` value automatically based on the value of `x`.
    /// 
    /// - Note:
    ///   Used by `Layout.Title.xAnchor`, `Layout.XAxis.RangeSelector.xAnchor`,
    ///   `Layout.Scene.Annotation.xAnchor`, `Layout.Legend.xAnchor`, `Layout.Annotation.xAnchor`,
    ///   `Layout.UpdateMenu.xAnchor`, `Layout.Slider.xAnchor`.
    public enum XAutoAnchor: String, Encodable {
        case auto
        case left
        case center
        case right
    }

    /// Sets the title's vertical alignment with respect to its y position.
    /// 
    /// *top* means that the title's cap line is at y, *bottom* means that the title's baseline is at y
    /// and *middle* means that the title's midline is at y. *auto* divides `yref` by three and
    /// calculates the `yanchor` value automatically based on the value of `y`.
    /// 
    /// - Note:
    ///   Used by `Layout.Title.yAnchor`, `Layout.XAxis.RangeSelector.yAnchor`,
    ///   `Layout.Scene.Annotation.yAnchor`, `Layout.Legend.yAnchor`, `Layout.Annotation.yAnchor`,
    ///   `Layout.UpdateMenu.yAnchor`, `Layout.Slider.yAnchor`.
    public enum YAutoAnchor: String, Encodable {
        case auto
        case top
        case middle
        case bottom
    }

    /// Sets the orientation of the modebar.
    /// 
    /// - Note:
    ///   Used by `Layout.ModeBar.orientation`, `Layout.Legend.orientation`, `Scatter.orientation`,
    ///   `Bar.orientation`, `Box.orientation`, `Histogram.orientation`, `Violin.orientation`,
    ///   `Funnel.orientation`, `Waterfall.orientation`, `Sankey.orientation`.
    public enum Orientation: String, Encodable {
        case v
        case h
    }

    /// Sets the horizontal alignment of the text content within hover label box.
    /// 
    /// Has an effect only if the hover label text spans more two or more lines
    /// 
    /// - Note:
    ///   Used by `Shared.HoverLabel.align`, `Scatter.HoverLabel.align`, `Bar.HoverLabel.align`,
    ///   `Box.HoverLabel.align`, `Heatmap.HoverLabel.align`, `Histogram.HoverLabel.align`,
    ///   `Histogram2D.HoverLabel.align`, `Histogram2DContour.HoverLabel.align`,
    ///   `Contour.HoverLabel.align`, `ScatterTernary.HoverLabel.align`, `Violin.HoverLabel.align`,
    ///   `Funnel.HoverLabel.align`, `Waterfall.HoverLabel.align`, `Image.HoverLabel.align`,
    ///   `Pie.HoverLabel.align`, `Sunburst.HoverLabel.align`, `Treemap.HoverLabel.align`,
    ///   `FunnelArea.HoverLabel.align`, `Scatter3D.HoverLabel.align`, `Surface.HoverLabel.align`,
    ///   `Isosurface.HoverLabel.align`, `Volume.HoverLabel.align`, `Mesh3D.HoverLabel.align`,
    ///   `Cone.HoverLabel.align`, `StreamTube.HoverLabel.align`, `ScatterGeo.HoverLabel.align`,
    ///   `Choropleth.HoverLabel.align`, `ScatterGL.HoverLabel.align`,
    ///   `ScatterPlotMatrix.HoverLabel.align`, `PointCloud.HoverLabel.align`,
    ///   `HeatmapGL.HoverLabel.align`, `ScatterMapbox.HoverLabel.align`,
    ///   `ChoroplethMapbox.HoverLabel.align`, `DensityMapbox.HoverLabel.align`,
    ///   `Sankey.HoverLabel.align`, `Sankey.Node.HoverLabel.align`, `Sankey.Link.HoverLabel.align`,
    ///   `Table.HoverLabel.align`, `ScatterCarpet.HoverLabel.align`, `OHLC.HoverLabel.align`,
    ///   `Candlestick.HoverLabel.align`, `ScatterPolar.HoverLabel.align`,
    ///   `ScatterPolarGL.HoverLabel.align`, `BarPolar.HoverLabel.align`.
    public enum AutoAlign: String, Encodable {
        case left
        case right
        case auto
    }

    /// Sets the default calendar system to use for interpreting and displaying dates throughout the
    /// plot.
    /// 
    /// - Note:
    ///   Used by `Layout.calendar`, `Layout.XAxis.calendar`, `Layout.YAxis.calendar`,
    ///   `Layout.Scene.XAxis.calendar`, `Layout.Scene.YAxis.calendar`, `Layout.Scene.ZAxis.calendar`,
    ///   `Layout.Polar.RadialAxis.calendar`, `Scatter.xCalendar`, `Scatter.yCalendar`, `Bar.xCalendar`,
    ///   `Bar.yCalendar`, `Box.xCalendar`, `Box.yCalendar`, `Heatmap.xCalendar`, `Heatmap.yCalendar`,
    ///   `Histogram.xCalendar`, `Histogram.yCalendar`, `Histogram2D.xCalendar`, `Histogram2D.yCalendar`,
    ///   `Histogram2DContour.xCalendar`, `Histogram2DContour.yCalendar`, `Contour.xCalendar`,
    ///   `Contour.yCalendar`, `Scatter3D.xCalendar`, `Scatter3D.yCalendar`, `Scatter3D.zCalendar`,
    ///   `Surface.xCalendar`, `Surface.yCalendar`, `Surface.zCalendar`, `Mesh3D.xCalendar`,
    ///   `Mesh3D.yCalendar`, `Mesh3D.zCalendar`, `ScatterGL.xCalendar`, `ScatterGL.yCalendar`,
    ///   `OHLC.xCalendar`, `Candlestick.xCalendar`.
    public enum Calendar: String, Encodable {
        case gregorian
        case chinese
        case coptic
        case discworld
        case ethiopian
        case hebrew
        case islamic
        case julian
        case mayan
        case nanakshahi
        case nepali
        case persian
        case jalali
        case taiwan
        case thai
        case ummalqura
    }

    /// Determines whether or not the range of this axis is computed in relation to the input data.
    /// 
    /// See `rangemode` for more info. If `range` is provided, then `autorange` is set to *false*.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.autoRange`, `Layout.YAxis.autoRange`, `Layout.Scene.XAxis.autoRange`,
    ///   `Layout.Scene.YAxis.autoRange`, `Layout.Scene.ZAxis.autoRange`,
    ///   `Layout.Polar.RadialAxis.autoRange`, `Carpet.AAxis.autoRange`, `Carpet.BAxis.autoRange`.
    public enum AutoRange: Encodable {
        case on
        case off
        case reversed
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .on:
                try container.encode(true)
            case .off:
                try container.encode(false)
            case .reversed:
                try container.encode("reversed")
            }
        }
    }

    /// If *normal*, the range is computed in relation to the extrema of the input data.
    /// 
    /// If *tozero*`, the range extends to 0, regardless of the input data If *nonnegative*, the range
    /// is non-negative, regardless of the input data. Applies only to linear axes.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.rangeMode`, `Layout.YAxis.rangeMode`, `Layout.Scene.XAxis.rangeMode`,
    ///   `Layout.Scene.YAxis.rangeMode`, `Layout.Scene.ZAxis.rangeMode`, `Carpet.AAxis.rangeMode`,
    ///   `Carpet.BAxis.rangeMode`.
    public enum RangeMode: String, Encodable {
        case normal
        case toZero = "tozero"
        case nonNegative = "nonnegative"
    }

    /// Sets the tick mode for this axis.
    /// 
    /// If *auto*, the number of ticks is set via `nticks`. If *linear*, the placement of the ticks is
    /// determined by a starting position `tick0` and a tick step `dtick` (*linear* is the default value
    /// if `tick0` and `dtick` are provided). If *array*, the placement of the ticks is set via
    /// `tickvals` and the tick text is `ticktext`. (*array* is the default value if `tickvals` is
    /// provided).
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.tickMode`, `Layout.YAxis.tickMode`, `Layout.Ternary.AAxis.tickMode`,
    ///   `Layout.Ternary.BAxis.tickMode`, `Layout.Ternary.CAxis.tickMode`, `Layout.Scene.XAxis.tickMode`,
    ///   `Layout.Scene.YAxis.tickMode`, `Layout.Scene.ZAxis.tickMode`,
    ///   `Layout.Polar.RadialAxis.tickMode`, `Layout.Polar.AngularAxis.tickMode`,
    ///   `Shared.ColorBar.tickMode`, `Shared.GradientMarker.ColorBar.tickMode`,
    ///   `Shared.Marker.ColorBar.tickMode`, `Heatmap.ColorBar.tickMode`,
    ///   `Histogram.Marker.ColorBar.tickMode`, `Histogram2D.ColorBar.tickMode`,
    ///   `Histogram2DContour.ColorBar.tickMode`, `Contour.ColorBar.tickMode`,
    ///   `ScatterTernary.GradientMarker.ColorBar.tickMode`, `Funnel.Marker.ColorBar.tickMode`,
    ///   `Sunburst.Marker.ColorBar.tickMode`, `Treemap.Marker.ColorBar.tickMode`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.tickMode`, `Shared.SymbolicMarker.ColorBar.tickMode`,
    ///   `Surface.ColorBar.tickMode`, `Isosurface.ColorBar.tickMode`, `Volume.ColorBar.tickMode`,
    ///   `Mesh3D.ColorBar.tickMode`, `Cone.ColorBar.tickMode`, `StreamTube.ColorBar.tickMode`,
    ///   `ScatterGeo.GradientMarker.ColorBar.tickMode`, `Choropleth.ColorBar.tickMode`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.tickMode`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.tickMode`, `HeatmapGL.ColorBar.tickMode`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.tickMode`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.tickMode`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.tickMode`, `ChoroplethMapbox.ColorBar.tickMode`,
    ///   `DensityMapbox.ColorBar.tickMode`, `Indicator.Gauge.Axis.tickMode`,
    ///   `ScatterCarpet.GradientMarker.ColorBar.tickMode`, `ContourCarpet.ColorBar.tickMode`,
    ///   `ScatterPolar.GradientMarker.ColorBar.tickMode`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.tickMode`, `BarPolar.Marker.ColorBar.tickMode`.
    public enum TickMode: String, Encodable {
        case auto
        case linear
        case array
    }

    /// Determines whether ticks are drawn or not.
    /// 
    /// If **, this axis' ticks are not drawn. If *outside* (*inside*), this axis' are drawn outside
    /// (inside) the axis lines.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.ticks`, `Layout.YAxis.ticks`, `Layout.Ternary.AAxis.ticks`,
    ///   `Layout.Ternary.BAxis.ticks`, `Layout.Ternary.CAxis.ticks`, `Layout.Scene.XAxis.ticks`,
    ///   `Layout.Scene.YAxis.ticks`, `Layout.Scene.ZAxis.ticks`, `Layout.Polar.RadialAxis.ticks`,
    ///   `Layout.Polar.AngularAxis.ticks`, `Shared.ColorBar.ticks`,
    ///   `Shared.GradientMarker.ColorBar.ticks`, `Shared.Marker.ColorBar.ticks`,
    ///   `Heatmap.ColorBar.ticks`, `Histogram.Marker.ColorBar.ticks`, `Histogram2D.ColorBar.ticks`,
    ///   `Histogram2DContour.ColorBar.ticks`, `Contour.ColorBar.ticks`,
    ///   `ScatterTernary.GradientMarker.ColorBar.ticks`, `Funnel.Marker.ColorBar.ticks`,
    ///   `Sunburst.Marker.ColorBar.ticks`, `Treemap.Marker.ColorBar.ticks`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.ticks`, `Shared.SymbolicMarker.ColorBar.ticks`,
    ///   `Surface.ColorBar.ticks`, `Isosurface.ColorBar.ticks`, `Volume.ColorBar.ticks`,
    ///   `Mesh3D.ColorBar.ticks`, `Cone.ColorBar.ticks`, `StreamTube.ColorBar.ticks`,
    ///   `ScatterGeo.GradientMarker.ColorBar.ticks`, `Choropleth.ColorBar.ticks`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.ticks`, `ScatterPlotMatrix.SymbolicMarker.ColorBar.ticks`,
    ///   `HeatmapGL.ColorBar.ticks`, `ParallelCoordinates.MarkerLine.ColorBar.ticks`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.ticks`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.ticks`, `ChoroplethMapbox.ColorBar.ticks`,
    ///   `DensityMapbox.ColorBar.ticks`, `Indicator.Gauge.Axis.ticks`,
    ///   `ScatterCarpet.GradientMarker.ColorBar.ticks`, `ContourCarpet.ColorBar.ticks`,
    ///   `ScatterPolar.GradientMarker.ColorBar.ticks`, `ScatterPolarGL.SymbolicMarker.ColorBar.ticks`,
    ///   `BarPolar.Marker.ColorBar.ticks`.
    public enum Ticks: String, Encodable {
        case outside
        case inside
        case off = ""
    }

    /// Determines if the axis lines or/and ticks are mirrored to the opposite side of the plotting
    /// area.
    /// 
    /// If *true*, the axis lines are mirrored. If *ticks*, the axis lines and ticks are mirrored. If
    /// *false*, mirroring is disable. If *all*, axis lines are mirrored on all shared-axes subplots. If
    /// *allticks*, axis lines and ticks are mirrored on all shared-axes subplots.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.mirror`, `Layout.YAxis.mirror`, `Layout.Scene.XAxis.mirror`,
    ///   `Layout.Scene.YAxis.mirror`, `Layout.Scene.ZAxis.mirror`.
    public enum Mirror: Encodable {
        case on
        case ticks
        case off
        case all
        case allTicks
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .on:
                try container.encode(true)
            case .ticks:
                try container.encode("ticks")
            case .off:
                try container.encode(false)
            case .all:
                try container.encode("all")
            case .allTicks:
                try container.encode("allticks")
            }
        }
    }

    /// If *all*, all tick labels are displayed with a prefix.
    /// 
    /// If *first*, only the first tick is displayed with a prefix. If *last*, only the last tick is
    /// displayed with a suffix. If *none*, tick prefixes are hidden.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.showTickPrefix`, `Layout.YAxis.showTickPrefix`,
    ///   `Layout.Ternary.AAxis.showTickPrefix`, `Layout.Ternary.BAxis.showTickPrefix`,
    ///   `Layout.Ternary.CAxis.showTickPrefix`, `Layout.Scene.XAxis.showTickPrefix`,
    ///   `Layout.Scene.YAxis.showTickPrefix`, `Layout.Scene.ZAxis.showTickPrefix`,
    ///   `Layout.Polar.RadialAxis.showTickPrefix`, `Layout.Polar.AngularAxis.showTickPrefix`,
    ///   `Shared.ColorBar.showTickPrefix`, `Shared.GradientMarker.ColorBar.showTickPrefix`,
    ///   `Shared.Marker.ColorBar.showTickPrefix`, `Heatmap.ColorBar.showTickPrefix`,
    ///   `Histogram.Marker.ColorBar.showTickPrefix`, `Histogram2D.ColorBar.showTickPrefix`,
    ///   `Histogram2DContour.ColorBar.showTickPrefix`, `Contour.ColorBar.showTickPrefix`,
    ///   `ScatterTernary.GradientMarker.ColorBar.showTickPrefix`,
    ///   `Funnel.Marker.ColorBar.showTickPrefix`, `Sunburst.Marker.ColorBar.showTickPrefix`,
    ///   `Treemap.Marker.ColorBar.showTickPrefix`, `Scatter3D.DashedMarkerLine.ColorBar.showTickPrefix`,
    ///   `Shared.SymbolicMarker.ColorBar.showTickPrefix`, `Surface.ColorBar.showTickPrefix`,
    ///   `Isosurface.ColorBar.showTickPrefix`, `Volume.ColorBar.showTickPrefix`,
    ///   `Mesh3D.ColorBar.showTickPrefix`, `Cone.ColorBar.showTickPrefix`,
    ///   `StreamTube.ColorBar.showTickPrefix`, `ScatterGeo.GradientMarker.ColorBar.showTickPrefix`,
    ///   `Choropleth.ColorBar.showTickPrefix`, `ScatterGL.SymbolicMarker.ColorBar.showTickPrefix`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.showTickPrefix`, `HeatmapGL.ColorBar.showTickPrefix`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.showTickPrefix`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.showTickPrefix`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.showTickPrefix`,
    ///   `ChoroplethMapbox.ColorBar.showTickPrefix`, `DensityMapbox.ColorBar.showTickPrefix`,
    ///   `Indicator.Gauge.Axis.showTickPrefix`, `Carpet.AAxis.showTickPrefix`,
    ///   `Carpet.BAxis.showTickPrefix`, `ScatterCarpet.GradientMarker.ColorBar.showTickPrefix`,
    ///   `ContourCarpet.ColorBar.showTickPrefix`, `ScatterPolar.GradientMarker.ColorBar.showTickPrefix`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.showTickPrefix`,
    ///   `BarPolar.Marker.ColorBar.showTickPrefix`.
    public enum ShowTickPrefix: String, Encodable {
        case all
        case first
        case last
        case none
    }

    /// Same as `showtickprefix` but for tick suffixes.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.showTickSuffix`, `Layout.YAxis.showTickSuffix`,
    ///   `Layout.Ternary.AAxis.showTickSuffix`, `Layout.Ternary.BAxis.showTickSuffix`,
    ///   `Layout.Ternary.CAxis.showTickSuffix`, `Layout.Scene.XAxis.showTickSuffix`,
    ///   `Layout.Scene.YAxis.showTickSuffix`, `Layout.Scene.ZAxis.showTickSuffix`,
    ///   `Layout.Polar.RadialAxis.showTickSuffix`, `Layout.Polar.AngularAxis.showTickSuffix`,
    ///   `Shared.ColorBar.showTickSuffix`, `Shared.GradientMarker.ColorBar.showTickSuffix`,
    ///   `Shared.Marker.ColorBar.showTickSuffix`, `Heatmap.ColorBar.showTickSuffix`,
    ///   `Histogram.Marker.ColorBar.showTickSuffix`, `Histogram2D.ColorBar.showTickSuffix`,
    ///   `Histogram2DContour.ColorBar.showTickSuffix`, `Contour.ColorBar.showTickSuffix`,
    ///   `ScatterTernary.GradientMarker.ColorBar.showTickSuffix`,
    ///   `Funnel.Marker.ColorBar.showTickSuffix`, `Sunburst.Marker.ColorBar.showTickSuffix`,
    ///   `Treemap.Marker.ColorBar.showTickSuffix`, `Scatter3D.DashedMarkerLine.ColorBar.showTickSuffix`,
    ///   `Shared.SymbolicMarker.ColorBar.showTickSuffix`, `Surface.ColorBar.showTickSuffix`,
    ///   `Isosurface.ColorBar.showTickSuffix`, `Volume.ColorBar.showTickSuffix`,
    ///   `Mesh3D.ColorBar.showTickSuffix`, `Cone.ColorBar.showTickSuffix`,
    ///   `StreamTube.ColorBar.showTickSuffix`, `ScatterGeo.GradientMarker.ColorBar.showTickSuffix`,
    ///   `Choropleth.ColorBar.showTickSuffix`, `ScatterGL.SymbolicMarker.ColorBar.showTickSuffix`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.showTickSuffix`, `HeatmapGL.ColorBar.showTickSuffix`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.showTickSuffix`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.showTickSuffix`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.showTickSuffix`,
    ///   `ChoroplethMapbox.ColorBar.showTickSuffix`, `DensityMapbox.ColorBar.showTickSuffix`,
    ///   `Indicator.Gauge.Axis.showTickSuffix`, `Carpet.AAxis.showTickSuffix`,
    ///   `Carpet.BAxis.showTickSuffix`, `ScatterCarpet.GradientMarker.ColorBar.showTickSuffix`,
    ///   `ContourCarpet.ColorBar.showTickSuffix`, `ScatterPolar.GradientMarker.ColorBar.showTickSuffix`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.showTickSuffix`,
    ///   `BarPolar.Marker.ColorBar.showTickSuffix`.
    public enum ShowTickSuffix: String, Encodable {
        case all
        case first
        case last
        case none
    }

    /// If *all*, all exponents are shown besides their significands.
    /// 
    /// If *first*, only the exponent of the first tick is shown. If *last*, only the exponent of the
    /// last tick is shown. If *none*, no exponents appear.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.showExponent`, `Layout.YAxis.showExponent`,
    ///   `Layout.Ternary.AAxis.showExponent`, `Layout.Ternary.BAxis.showExponent`,
    ///   `Layout.Ternary.CAxis.showExponent`, `Layout.Scene.XAxis.showExponent`,
    ///   `Layout.Scene.YAxis.showExponent`, `Layout.Scene.ZAxis.showExponent`,
    ///   `Layout.Polar.RadialAxis.showExponent`, `Layout.Polar.AngularAxis.showExponent`,
    ///   `Shared.ColorBar.showExponent`, `Shared.GradientMarker.ColorBar.showExponent`,
    ///   `Shared.Marker.ColorBar.showExponent`, `Heatmap.ColorBar.showExponent`,
    ///   `Histogram.Marker.ColorBar.showExponent`, `Histogram2D.ColorBar.showExponent`,
    ///   `Histogram2DContour.ColorBar.showExponent`, `Contour.ColorBar.showExponent`,
    ///   `ScatterTernary.GradientMarker.ColorBar.showExponent`, `Funnel.Marker.ColorBar.showExponent`,
    ///   `Sunburst.Marker.ColorBar.showExponent`, `Treemap.Marker.ColorBar.showExponent`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.showExponent`,
    ///   `Shared.SymbolicMarker.ColorBar.showExponent`, `Surface.ColorBar.showExponent`,
    ///   `Isosurface.ColorBar.showExponent`, `Volume.ColorBar.showExponent`,
    ///   `Mesh3D.ColorBar.showExponent`, `Cone.ColorBar.showExponent`,
    ///   `StreamTube.ColorBar.showExponent`, `ScatterGeo.GradientMarker.ColorBar.showExponent`,
    ///   `Choropleth.ColorBar.showExponent`, `ScatterGL.SymbolicMarker.ColorBar.showExponent`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.showExponent`, `HeatmapGL.ColorBar.showExponent`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.showExponent`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.showExponent`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.showExponent`, `ChoroplethMapbox.ColorBar.showExponent`,
    ///   `DensityMapbox.ColorBar.showExponent`, `Indicator.Gauge.Axis.showExponent`,
    ///   `Carpet.AAxis.showExponent`, `Carpet.BAxis.showExponent`,
    ///   `ScatterCarpet.GradientMarker.ColorBar.showExponent`, `ContourCarpet.ColorBar.showExponent`,
    ///   `ScatterPolar.GradientMarker.ColorBar.showExponent`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.showExponent`, `BarPolar.Marker.ColorBar.showExponent`.
    public enum ShowExponent: String, Encodable {
        case all
        case first
        case last
        case none
    }

    /// Determines a formatting rule for the tick exponents.
    /// 
    /// For example, consider the number 1,000,000,000. If *none*, it appears as 1,000,000,000. If *e*,
    /// 1e+9. If *E*, 1E+9. If *power*, 1x10^9 (with 9 in a super script). If *SI*, 1G. If *B*, 1B.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.exponentFormat`, `Layout.YAxis.exponentFormat`,
    ///   `Layout.Ternary.AAxis.exponentFormat`, `Layout.Ternary.BAxis.exponentFormat`,
    ///   `Layout.Ternary.CAxis.exponentFormat`, `Layout.Scene.XAxis.exponentFormat`,
    ///   `Layout.Scene.YAxis.exponentFormat`, `Layout.Scene.ZAxis.exponentFormat`,
    ///   `Layout.Polar.RadialAxis.exponentFormat`, `Layout.Polar.AngularAxis.exponentFormat`,
    ///   `Shared.ColorBar.exponentFormat`, `Shared.GradientMarker.ColorBar.exponentFormat`,
    ///   `Shared.Marker.ColorBar.exponentFormat`, `Heatmap.ColorBar.exponentFormat`,
    ///   `Histogram.Marker.ColorBar.exponentFormat`, `Histogram2D.ColorBar.exponentFormat`,
    ///   `Histogram2DContour.ColorBar.exponentFormat`, `Contour.ColorBar.exponentFormat`,
    ///   `ScatterTernary.GradientMarker.ColorBar.exponentFormat`,
    ///   `Funnel.Marker.ColorBar.exponentFormat`, `Sunburst.Marker.ColorBar.exponentFormat`,
    ///   `Treemap.Marker.ColorBar.exponentFormat`, `Scatter3D.DashedMarkerLine.ColorBar.exponentFormat`,
    ///   `Shared.SymbolicMarker.ColorBar.exponentFormat`, `Surface.ColorBar.exponentFormat`,
    ///   `Isosurface.ColorBar.exponentFormat`, `Volume.ColorBar.exponentFormat`,
    ///   `Mesh3D.ColorBar.exponentFormat`, `Cone.ColorBar.exponentFormat`,
    ///   `StreamTube.ColorBar.exponentFormat`, `ScatterGeo.GradientMarker.ColorBar.exponentFormat`,
    ///   `Choropleth.ColorBar.exponentFormat`, `ScatterGL.SymbolicMarker.ColorBar.exponentFormat`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.exponentFormat`, `HeatmapGL.ColorBar.exponentFormat`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.exponentFormat`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.exponentFormat`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.exponentFormat`,
    ///   `ChoroplethMapbox.ColorBar.exponentFormat`, `DensityMapbox.ColorBar.exponentFormat`,
    ///   `Indicator.Gauge.Axis.exponentFormat`, `Carpet.AAxis.exponentFormat`,
    ///   `Carpet.BAxis.exponentFormat`, `ScatterCarpet.GradientMarker.ColorBar.exponentFormat`,
    ///   `ContourCarpet.ColorBar.exponentFormat`, `ScatterPolar.GradientMarker.ColorBar.exponentFormat`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.exponentFormat`,
    ///   `BarPolar.Marker.ColorBar.exponentFormat`.
    public enum ExponentFormat: String, Encodable {
        case none
        case e
        case E
        case power
        case SI
        case B
    }

    /// Sets the layer on which this axis is displayed.
    /// 
    /// If *above traces*, this axis is displayed above all the subplot's traces If *below traces*, this
    /// axis is displayed below all the subplot's traces, but above the grid lines. Useful when used
    /// together with scatter-like traces with `cliponaxis` set to *false* to show markers and/or text
    /// nodes above this axis.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.layer`, `Layout.YAxis.layer`, `Layout.Ternary.AAxis.layer`,
    ///   `Layout.Ternary.BAxis.layer`, `Layout.Ternary.CAxis.layer`, `Layout.Polar.RadialAxis.layer`,
    ///   `Layout.Polar.AngularAxis.layer`.
    public enum Layer: String, Encodable {
        case aboveTraces = "above traces"
        case belowTraces = "below traces"
    }

    /// Specifies the ordering logic for the case of categorical variables.
    /// 
    /// By default, plotly uses *trace*, which specifies the order that is present in the data supplied.
    /// Set `categoryorder` to *category ascending* or *category descending* if order should be
    /// determined by the alphanumerical order of the category names. Set `categoryorder` to *array* to
    /// derive the ordering from the attribute `categoryarray`. If a category is not found in the
    /// `categoryarray` array, the sorting behavior for that attribute will be identical to the *trace*
    /// mode. The unspecified categories will follow the categories in `categoryarray`. Set
    /// `categoryorder` to *total ascending* or *total descending* if order should be determined by the
    /// numerical order of the values. Similarly, the order can be determined by the min, max, sum, mean
    /// or median of all the values.
    /// 
    /// - Note:
    ///   Used by `Layout.XAxis.categoryOrder`, `Layout.YAxis.categoryOrder`,
    ///   `Layout.Scene.XAxis.categoryOrder`, `Layout.Scene.YAxis.categoryOrder`,
    ///   `Layout.Scene.ZAxis.categoryOrder`, `Layout.Polar.RadialAxis.categoryOrder`,
    ///   `Layout.Polar.AngularAxis.categoryOrder`.
    public enum CategoryOrder: String, Encodable {
        case trace
        case categoryAscending = "category ascending"
        case categoryDescending = "category descending"
        case array
        case totalAscending = "total ascending"
        case totalDescending = "total descending"
        case minAscending = "min ascending"
        case minDescending = "min descending"
        case maxAscending = "max ascending"
        case maxDescending = "max descending"
        case sumAscending = "sum ascending"
        case sumDescending = "sum descending"
        case meanAscending = "mean ascending"
        case meanDescending = "mean descending"
        case medianAscending = "median ascending"
        case medianDescending = "median descending"
    }

    /// Sets the horizontal alignment of the `text` within the box.
    /// 
    /// Has an effect only if `text` spans more two or more lines (i.e. `text` contains one or more <br>
    /// HTML tags) or if an explicit width is set to override the text width.
    /// 
    /// - Note:
    ///   Used by `Layout.Scene.Annotation.align`, `Layout.Annotation.align`, `Indicator.align`,
    ///   `Indicator.Title.align`, `Table.Header.align`, `Table.Cells.align`.
    public enum HorizontalAlign: String, Encodable {
        case left
        case center
        case right
    }

    /// Sets the vertical alignment of the `text` within the box.
    /// 
    /// Has an effect only if an explicit height is set to override the text height.
    /// 
    /// - Note:
    ///   Used by `Layout.Scene.Annotation.verticalAlign`, `Layout.Legend.verticalAlign`,
    ///   `Layout.Annotation.verticalAlign`.
    public enum VerticalAlign: String, Encodable {
        case top
        case middle
        case bottom
    }

    /// Sets the positions of the `text` elements with respects to the (x,y) coordinates.
    /// 
    /// - Note:
    ///   Used by `Layout.Mapbox.Layer.Symbol.textPosition`, `Scatter.textPosition`,
    ///   `ScatterTernary.textPosition`, `Treemap.textPosition`, `Scatter3D.textPosition`,
    ///   `ScatterGeo.textPosition`, `ScatterGL.textPosition`, `ScatterMapbox.textPosition`,
    ///   `ScatterCarpet.textPosition`, `ScatterPolar.textPosition`, `ScatterPolarGL.textPosition`.
    public enum TextPosition: String, Encodable {
        case topLeft = "top left"
        case topCenter = "top center"
        case topRight = "top right"
        case middleLeft = "middle left"
        case middleCenter = "middle center"
        case middleRight = "middle right"
        case bottomLeft = "bottom left"
        case bottomCenter = "bottom center"
        case bottomRight = "bottom right"
    }

    /// Sets the annotation's x coordinate axis.
    /// 
    /// If set to an x axis id (e.g. *x* or *x2*), the `x` position refers to an x coordinate If set to
    /// *paper*, the `x` position refers to the distance from the left side of the plotting area in
    /// normalized coordinates where 0 (1) corresponds to the left (right) side.
    /// 
    /// - Note:
    ///   Used by `Layout.Annotation.xReference`, `Layout.Shape.xReference`, `Layout.Image.xReference`.
    public enum XAxisReference: Encodable {
        case paper
        case xAxis(Layout.XAxis)
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .paper:
                try container.encode("paper")
            case .xAxis(let axis):
                try container.encode("x\(axis.uid)")
            }
        }
    }

    /// Sets the annotation's y coordinate axis.
    /// 
    /// If set to an y axis id (e.g. *y* or *y2*), the `y` position refers to an y coordinate If set to
    /// *paper*, the `y` position refers to the distance from the bottom of the plotting area in
    /// normalized coordinates where 0 (1) corresponds to the bottom (top).
    /// 
    /// - Note:
    ///   Used by `Layout.Annotation.yReference`, `Layout.Shape.yReference`, `Layout.Image.yReference`.
    public enum YAxisReference: Encodable {
        case paper
        case yAxis(Layout.YAxis)
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .paper:
                try container.encode("paper")
            case .yAxis(let axis):
                try container.encode("y\(axis.uid)")
            }
        }
    }

    /// Sets the anchor for the x position
    /// 
    /// - Note:
    ///   Used by `Layout.Image.xAnchor`, `Layout.Slider.CurrentValue.xAnchor`, `Shared.ColorBar.xAnchor`,
    ///   `Shared.GradientMarker.ColorBar.xAnchor`, `Shared.Marker.ColorBar.xAnchor`,
    ///   `Heatmap.ColorBar.xAnchor`, `Histogram.Marker.ColorBar.xAnchor`, `Histogram2D.ColorBar.xAnchor`,
    ///   `Histogram2DContour.ColorBar.xAnchor`, `Contour.ColorBar.xAnchor`,
    ///   `ScatterTernary.GradientMarker.ColorBar.xAnchor`, `Funnel.Marker.ColorBar.xAnchor`,
    ///   `Sunburst.Marker.ColorBar.xAnchor`, `Treemap.Marker.ColorBar.xAnchor`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.xAnchor`, `Shared.SymbolicMarker.ColorBar.xAnchor`,
    ///   `Surface.ColorBar.xAnchor`, `Isosurface.ColorBar.xAnchor`, `Volume.ColorBar.xAnchor`,
    ///   `Mesh3D.ColorBar.xAnchor`, `Cone.ColorBar.xAnchor`, `StreamTube.ColorBar.xAnchor`,
    ///   `ScatterGeo.GradientMarker.ColorBar.xAnchor`, `Choropleth.ColorBar.xAnchor`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.xAnchor`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.xAnchor`, `HeatmapGL.ColorBar.xAnchor`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.xAnchor`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.xAnchor`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.xAnchor`, `ChoroplethMapbox.ColorBar.xAnchor`,
    ///   `DensityMapbox.ColorBar.xAnchor`, `ScatterCarpet.GradientMarker.ColorBar.xAnchor`,
    ///   `ContourCarpet.ColorBar.xAnchor`, `ScatterPolar.GradientMarker.ColorBar.xAnchor`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.xAnchor`, `BarPolar.Marker.ColorBar.xAnchor`.
    public enum XAnchor: String, Encodable {
        case left
        case center
        case right
    }

    /// Sets the anchor for the y position.
    /// 
    /// - Note:
    ///   Used by `Layout.Image.yAnchor`, `Shared.ColorBar.yAnchor`,
    ///   `Shared.GradientMarker.ColorBar.yAnchor`, `Shared.Marker.ColorBar.yAnchor`,
    ///   `Heatmap.ColorBar.yAnchor`, `Histogram.Marker.ColorBar.yAnchor`, `Histogram2D.ColorBar.yAnchor`,
    ///   `Histogram2DContour.ColorBar.yAnchor`, `Contour.ColorBar.yAnchor`,
    ///   `ScatterTernary.GradientMarker.ColorBar.yAnchor`, `Funnel.Marker.ColorBar.yAnchor`,
    ///   `Sunburst.Marker.ColorBar.yAnchor`, `Treemap.Marker.ColorBar.yAnchor`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.yAnchor`, `Shared.SymbolicMarker.ColorBar.yAnchor`,
    ///   `Surface.ColorBar.yAnchor`, `Isosurface.ColorBar.yAnchor`, `Volume.ColorBar.yAnchor`,
    ///   `Mesh3D.ColorBar.yAnchor`, `Cone.ColorBar.yAnchor`, `StreamTube.ColorBar.yAnchor`,
    ///   `ScatterGeo.GradientMarker.ColorBar.yAnchor`, `Choropleth.ColorBar.yAnchor`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.yAnchor`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.yAnchor`, `HeatmapGL.ColorBar.yAnchor`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.yAnchor`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.yAnchor`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.yAnchor`, `ChoroplethMapbox.ColorBar.yAnchor`,
    ///   `DensityMapbox.ColorBar.yAnchor`, `ScatterCarpet.GradientMarker.ColorBar.yAnchor`,
    ///   `ContourCarpet.ColorBar.yAnchor`, `ScatterPolar.GradientMarker.ColorBar.yAnchor`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.yAnchor`, `BarPolar.Marker.ColorBar.yAnchor`.
    public enum YAnchor: String, Encodable {
        case top
        case middle
        case bottom
    }

    /// Determines whether this slider length is set in units of plot *fraction* or in *pixels.
    /// 
    /// Use `len` to set the value.
    /// 
    /// - Note:
    ///   Used by `Layout.Slider.lengthMode`, `Shared.ColorBar.lengthMode`,
    ///   `Shared.GradientMarker.ColorBar.lengthMode`, `Shared.Marker.ColorBar.lengthMode`,
    ///   `Heatmap.ColorBar.lengthMode`, `Histogram.Marker.ColorBar.lengthMode`,
    ///   `Histogram2D.ColorBar.lengthMode`, `Histogram2DContour.ColorBar.lengthMode`,
    ///   `Contour.ColorBar.lengthMode`, `ScatterTernary.GradientMarker.ColorBar.lengthMode`,
    ///   `Funnel.Marker.ColorBar.lengthMode`, `Sunburst.Marker.ColorBar.lengthMode`,
    ///   `Treemap.Marker.ColorBar.lengthMode`, `Scatter3D.DashedMarkerLine.ColorBar.lengthMode`,
    ///   `Shared.SymbolicMarker.ColorBar.lengthMode`, `Surface.ColorBar.lengthMode`,
    ///   `Isosurface.ColorBar.lengthMode`, `Volume.ColorBar.lengthMode`, `Mesh3D.ColorBar.lengthMode`,
    ///   `Cone.ColorBar.lengthMode`, `StreamTube.ColorBar.lengthMode`,
    ///   `ScatterGeo.GradientMarker.ColorBar.lengthMode`, `Choropleth.ColorBar.lengthMode`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.lengthMode`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.lengthMode`, `HeatmapGL.ColorBar.lengthMode`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.lengthMode`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.lengthMode`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.lengthMode`, `ChoroplethMapbox.ColorBar.lengthMode`,
    ///   `DensityMapbox.ColorBar.lengthMode`, `ScatterCarpet.GradientMarker.ColorBar.lengthMode`,
    ///   `ContourCarpet.ColorBar.lengthMode`, `ScatterPolar.GradientMarker.ColorBar.lengthMode`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.lengthMode`, `BarPolar.Marker.ColorBar.lengthMode`.
    public enum LengthMode: String, Encodable {
        case fraction
        case pixels
    }

    /// Determines whether this color bar's thickness (i.e.
    /// 
    /// the measure in the constant color direction) is set in units of plot *fraction* or in *pixels*.
    /// Use `thickness` to set the value.
    /// 
    /// - Note:
    ///   Used by `Shared.ColorBar.thicknessMode`, `Shared.GradientMarker.ColorBar.thicknessMode`,
    ///   `Shared.Marker.ColorBar.thicknessMode`, `Heatmap.ColorBar.thicknessMode`,
    ///   `Histogram.Marker.ColorBar.thicknessMode`, `Histogram2D.ColorBar.thicknessMode`,
    ///   `Histogram2DContour.ColorBar.thicknessMode`, `Contour.ColorBar.thicknessMode`,
    ///   `ScatterTernary.GradientMarker.ColorBar.thicknessMode`, `Funnel.Marker.ColorBar.thicknessMode`,
    ///   `Sunburst.Marker.ColorBar.thicknessMode`, `Treemap.Marker.ColorBar.thicknessMode`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.thicknessMode`,
    ///   `Shared.SymbolicMarker.ColorBar.thicknessMode`, `Surface.ColorBar.thicknessMode`,
    ///   `Isosurface.ColorBar.thicknessMode`, `Volume.ColorBar.thicknessMode`,
    ///   `Mesh3D.ColorBar.thicknessMode`, `Cone.ColorBar.thicknessMode`,
    ///   `StreamTube.ColorBar.thicknessMode`, `ScatterGeo.GradientMarker.ColorBar.thicknessMode`,
    ///   `Choropleth.ColorBar.thicknessMode`, `ScatterGL.SymbolicMarker.ColorBar.thicknessMode`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.thicknessMode`, `HeatmapGL.ColorBar.thicknessMode`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.thicknessMode`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.thicknessMode`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.thicknessMode`,
    ///   `ChoroplethMapbox.ColorBar.thicknessMode`, `DensityMapbox.ColorBar.thicknessMode`,
    ///   `ScatterCarpet.GradientMarker.ColorBar.thicknessMode`, `ContourCarpet.ColorBar.thicknessMode`,
    ///   `ScatterPolar.GradientMarker.ColorBar.thicknessMode`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.thicknessMode`,
    ///   `BarPolar.Marker.ColorBar.thicknessMode`.
    public enum ThicknessMode: String, Encodable {
        case fraction
        case pixels
    }

    /// Determines the location of color bar's title with respect to the color bar.
    /// 
    /// Note that the title's location used to be set by the now deprecated `titleside` attribute.
    /// 
    /// - Note:
    ///   Used by `Shared.ColorBar.Title.side`, `Shared.GradientMarker.ColorBar.Title.side`,
    ///   `Shared.Marker.ColorBar.Title.side`, `Heatmap.ColorBar.Title.side`,
    ///   `Histogram.Marker.ColorBar.Title.side`, `Histogram2D.ColorBar.Title.side`,
    ///   `Histogram2DContour.ColorBar.Title.side`, `Contour.ColorBar.Title.side`,
    ///   `ScatterTernary.GradientMarker.ColorBar.Title.side`, `Funnel.Marker.ColorBar.Title.side`,
    ///   `Sunburst.Marker.ColorBar.Title.side`, `Treemap.Marker.ColorBar.Title.side`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.Title.side`, `Shared.SymbolicMarker.ColorBar.Title.side`,
    ///   `Surface.ColorBar.Title.side`, `Isosurface.ColorBar.Title.side`, `Volume.ColorBar.Title.side`,
    ///   `Mesh3D.ColorBar.Title.side`, `Cone.ColorBar.Title.side`, `StreamTube.ColorBar.Title.side`,
    ///   `ScatterGeo.GradientMarker.ColorBar.Title.side`, `Choropleth.ColorBar.Title.side`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.Title.side`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.Title.side`, `HeatmapGL.ColorBar.Title.side`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.Title.side`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.Title.side`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.Title.side`, `ChoroplethMapbox.ColorBar.Title.side`,
    ///   `DensityMapbox.ColorBar.Title.side`, `ScatterCarpet.GradientMarker.ColorBar.Title.side`,
    ///   `ContourCarpet.ColorBar.Title.side`, `ScatterPolar.GradientMarker.ColorBar.Title.side`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.Title.side`, `BarPolar.Marker.ColorBar.Title.side`.
    public enum Side: String, Encodable {
        case right
        case top
        case bottom
    }

    /// Determines whether or not this trace is visible.
    /// 
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    /// 
    /// - Note:
    ///   Used by `Scatter.visible`, `Bar.visible`, `Box.visible`, `Heatmap.visible`, `Histogram.visible`,
    ///   `Histogram2D.visible`, `Histogram2DContour.visible`, `Contour.visible`,
    ///   `ScatterTernary.visible`, `Violin.visible`, `Funnel.visible`, `Waterfall.visible`,
    ///   `Image.visible`, `Pie.visible`, `Sunburst.visible`, `Treemap.visible`, `FunnelArea.visible`,
    ///   `Scatter3D.visible`, `Surface.visible`, `Isosurface.visible`, `Volume.visible`,
    ///   `Mesh3D.visible`, `Cone.visible`, `StreamTube.visible`, `ScatterGeo.visible`,
    ///   `Choropleth.visible`, `ScatterGL.visible`, `ScatterPlotMatrix.visible`, `PointCloud.visible`,
    ///   `HeatmapGL.visible`, `ParallelCoordinates.visible`, `ParallelCategories.visible`,
    ///   `ScatterMapbox.visible`, `ChoroplethMapbox.visible`, `DensityMapbox.visible`, `Sankey.visible`,
    ///   `Indicator.visible`, `Table.visible`, `Carpet.visible`, `ScatterCarpet.visible`,
    ///   `ContourCarpet.visible`, `OHLC.visible`, `Candlestick.visible`, `ScatterPolar.visible`,
    ///   `ScatterPolarGL.visible`, `BarPolar.visible`.
    public enum Visible: Encodable {
        case on
        case off
        case legendOnly
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .on:
                try container.encode(true)
            case .off:
                try container.encode(false)
            case .legendOnly:
                try container.encode("legendonly")
            }
        }
    }

    /// Sets the area to fill with a solid color.
    /// 
    /// Defaults to *none* unless this trace is stacked, then it gets *tonexty* (*tonextx*) if
    /// `orientation` is *v* (*h*) Use with `fillcolor` if not *none*. *tozerox* and *tozeroy* fill to
    /// x=0 and y=0 respectively. *tonextx* and *tonexty* fill between the endpoints of this trace and
    /// the endpoints of the trace before it, connecting those endpoints with straight lines (to make a
    /// stacked area graph); if there is no trace before it, they behave like *tozerox* and *tozeroy*.
    /// *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into
    /// a closed shape. *tonext* fills the space between two traces if one completely encloses the other
    /// (eg consecutive contour lines), and behaves like *toself* if there is no trace before it.
    /// *tonext* should not be used if one trace does not enclose the other. Traces in a `stackgroup`
    /// will only fill to (or be filled to) other traces in the same group. With multiple `stackgroup`s
    /// or some traces stacked and some not, if fill-linked traces are not already consecutive, the
    /// later ones will be pushed down in the drawing order.
    /// 
    /// - Note:
    ///   Used by `Scatter.fill`, `ScatterGL.fill`, `ScatterPolarGL.fill`.
    public enum Fill: String, Encodable {
        case none
        case toZeroY = "tozeroy"
        case toZeroX = "tozerox"
        case toNextY = "tonexty"
        case toNextX = "tonextx"
        case toSelf = "toself"
        case toNext = "tonext"
    }

    /// Sets the marker symbol type.
    /// 
    /// Adding 100 is equivalent to appending *-open* to a symbol name. Adding 200 is equivalent to
    /// appending *-dot* to a symbol name. Adding 300 is equivalent to appending *-open-dot* or
    /// *dot-open* to a symbol name.
    /// 
    /// - Note:
    ///   Used by `Shared.GradientMarker.symbol`, `Box.SymbolicMarker.symbol`,
    ///   `ScatterTernary.GradientMarker.symbol`, `Violin.SymbolicMarker.symbol`,
    ///   `ScatterGeo.GradientMarker.symbol`, `ScatterGL.SymbolicMarker.symbol`,
    ///   `ScatterPlotMatrix.SymbolicMarker.symbol`, `ScatterCarpet.GradientMarker.symbol`,
    ///   `ScatterPolar.GradientMarker.symbol`, `ScatterPolarGL.SymbolicMarker.symbol`.
    public enum Symbol: String, Encodable {
        case circle
        case circleOpen = "circle-open"
        case circleDot = "circle-dot"
        case circleOpenDot = "circle-open-dot"
        case square
        case squareOpen = "square-open"
        case squareDot = "square-dot"
        case squareOpenDot = "square-open-dot"
        case diamond
        case diamondOpen = "diamond-open"
        case diamondDot = "diamond-dot"
        case diamondOpenDot = "diamond-open-dot"
        case cross
        case crossOpen = "cross-open"
        case crossDot = "cross-dot"
        case crossOpenDot = "cross-open-dot"
        case x
        case xOpen = "x-open"
        case xDot = "x-dot"
        case xOpenDot = "x-open-dot"
        case triangleUp = "triangle-up"
        case triangleUpOpen = "triangle-up-open"
        case triangleUpDot = "triangle-up-dot"
        case triangleUpOpenDot = "triangle-up-open-dot"
        case triangleDown = "triangle-down"
        case triangleDownOpen = "triangle-down-open"
        case triangleDownDot = "triangle-down-dot"
        case triangleDownOpenDot = "triangle-down-open-dot"
        case triangleLeft = "triangle-left"
        case triangleLeftOpen = "triangle-left-open"
        case triangleLeftDot = "triangle-left-dot"
        case triangleLeftOpenDot = "triangle-left-open-dot"
        case triangleRight = "triangle-right"
        case triangleRightOpen = "triangle-right-open"
        case triangleRightDot = "triangle-right-dot"
        case triangleRightOpenDot = "triangle-right-open-dot"
        case triangleNE = "triangle-ne"
        case triangleNEOpen = "triangle-ne-open"
        case triangleNEDot = "triangle-ne-dot"
        case triangleNEOpenDot = "triangle-ne-open-dot"
        case triangleSE = "triangle-se"
        case triangleSEOpen = "triangle-se-open"
        case triangleSEDot = "triangle-se-dot"
        case triangleSEOpenDot = "triangle-se-open-dot"
        case triangleSW = "triangle-sw"
        case triangleSWOpen = "triangle-sw-open"
        case triangleSWDot = "triangle-sw-dot"
        case triangleSWOpenDot = "triangle-sw-open-dot"
        case triangleNW = "triangle-nw"
        case triangleNWOpen = "triangle-nw-open"
        case triangleNWDot = "triangle-nw-dot"
        case triangleNWOpenDot = "triangle-nw-open-dot"
        case pentagon
        case pentagonOpen = "pentagon-open"
        case pentagonDot = "pentagon-dot"
        case pentagonOpenDot = "pentagon-open-dot"
        case hexagon
        case hexagonOpen = "hexagon-open"
        case hexagonDot = "hexagon-dot"
        case hexagonOpenDot = "hexagon-open-dot"
        case hexagon2
        case hexagon2Open = "hexagon2-open"
        case hexagon2Dot = "hexagon2-dot"
        case hexagon2OpenDot = "hexagon2-open-dot"
        case octagon
        case octagonOpen = "octagon-open"
        case octagonDot = "octagon-dot"
        case octagonOpenDot = "octagon-open-dot"
        case star
        case starOpen = "star-open"
        case starDot = "star-dot"
        case starOpenDot = "star-open-dot"
        case hexagram
        case hexagramOpen = "hexagram-open"
        case hexagramDot = "hexagram-dot"
        case hexagramOpenDot = "hexagram-open-dot"
        case starTriangleUp = "star-triangle-up"
        case starTriangleUpOpen = "star-triangle-up-open"
        case starTriangleUpDot = "star-triangle-up-dot"
        case starTriangleUpOpenDot = "star-triangle-up-open-dot"
        case starTriangleDown = "star-triangle-down"
        case starTriangleDownOpen = "star-triangle-down-open"
        case starTriangleDownDot = "star-triangle-down-dot"
        case starTriangleDownOpenDot = "star-triangle-down-open-dot"
        case starSquare = "star-square"
        case starSquareOpen = "star-square-open"
        case starSquareDot = "star-square-dot"
        case starSquareOpenDot = "star-square-open-dot"
        case starDiamond = "star-diamond"
        case starDiamondOpen = "star-diamond-open"
        case starDiamondDot = "star-diamond-dot"
        case starDiamondOpenDot = "star-diamond-open-dot"
        case diamondTall = "diamond-tall"
        case diamondTallOpen = "diamond-tall-open"
        case diamondTallDot = "diamond-tall-dot"
        case diamondTallOpenDot = "diamond-tall-open-dot"
        case diamondWide = "diamond-wide"
        case diamondWideOpen = "diamond-wide-open"
        case diamondWideDot = "diamond-wide-dot"
        case diamondWideOpenDot = "diamond-wide-open-dot"
        case hourglass
        case hourglassOpen = "hourglass-open"
        case bowTie = "bowtie"
        case bowTieOpen = "bowtie-open"
        case circleCross = "circle-cross"
        case circleCrossOpen = "circle-cross-open"
        case circleX = "circle-x"
        case circleXOpen = "circle-x-open"
        case squareCross = "square-cross"
        case squareCrossOpen = "square-cross-open"
        case squareX = "square-x"
        case squareXOpen = "square-x-open"
        case diamondCross = "diamond-cross"
        case diamondCrossOpen = "diamond-cross-open"
        case diamondX = "diamond-x"
        case diamondXOpen = "diamond-x-open"
        case crossThin = "cross-thin"
        case crossThinOpen = "cross-thin-open"
        case xThin = "x-thin"
        case xThinOpen = "x-thin-open"
        case asterisk
        case asteriskOpen = "asterisk-open"
        case hash
        case hashOpen = "hash-open"
        case hashDot = "hash-dot"
        case hashOpenDot = "hash-open-dot"
        case yUp = "y-up"
        case yUpOpen = "y-up-open"
        case yDown = "y-down"
        case yDownOpen = "y-down-open"
        case yLeft = "y-left"
        case yLeftOpen = "y-left-open"
        case yRight = "y-right"
        case yRightOpen = "y-right-open"
        case lineEw = "line-ew"
        case lineEwOpen = "line-ew-open"
        case lineNS = "line-ns"
        case lineNSOpen = "line-ns-open"
        case lineNE = "line-ne"
        case lineNEOpen = "line-ne-open"
        case lineNW = "line-nw"
        case lineNWOpen = "line-nw-open"
    }

    /// Has an effect only if `marker.size` is set to a numerical array.
    /// 
    /// Sets the rule for which the data in `size` is converted to pixels.
    /// 
    /// - Note:
    ///   Used by `Shared.GradientMarker.sizeMode`, `ScatterTernary.GradientMarker.sizeMode`,
    ///   `Shared.SymbolicMarker.sizeMode`, `ScatterGeo.GradientMarker.sizeMode`,
    ///   `ScatterGL.SymbolicMarker.sizeMode`, `ScatterPlotMatrix.SymbolicMarker.sizeMode`,
    ///   `ScatterMapbox.SymbolicMarker.sizeMode`, `ScatterCarpet.GradientMarker.sizeMode`,
    ///   `ScatterPolar.GradientMarker.sizeMode`, `ScatterPolarGL.SymbolicMarker.sizeMode`.
    public enum SizeMode: String, Encodable {
        case diameter
        case area
    }

    /// Specifies the location of the `text`.
    /// 
    /// *inside* positions `text` inside, next to the bar end (rotated and scaled if needed). *outside*
    /// positions `text` outside, next to the bar end (scaled if needed), unless there is another bar
    /// stacked on this one, then the text gets pushed inside. *auto* tries to position `text` inside
    /// the bar, but if the bar is too small and no bar is stacked on this one the text is moved
    /// outside.
    /// 
    /// - Note:
    ///   Used by `Bar.textPosition`, `Funnel.textPosition`, `Waterfall.textPosition`, `Pie.textPosition`.
    public enum AdjacentPosition: String, Encodable {
        case inside
        case outside
        case auto
        case none
    }

    /// Determines if texts are kept at center or start/end points in `textposition` *inside* mode.
    /// 
    /// - Note:
    ///   Used by `Bar.insideTextAnchor`, `Funnel.insideTextAnchor`, `Waterfall.insideTextAnchor`.
    public enum InsideTextAnchor: String, Encodable {
        case end
        case middle
        case start
    }

    /// Constrain the size of text inside or outside a bar to be no larger than the bar itself.
    /// 
    /// - Note:
    ///   Used by `Bar.constrainText`, `Funnel.constrainText`, `Waterfall.constrainText`.
    public enum ConstrainText: String, Encodable {
        case inside
        case outside
        case both
        case none
    }

    /// If *array*, the heatmap's x coordinates are given by *x* (the default behavior when `x` is
    /// provided).
    /// 
    /// If *scaled*, the heatmap's x coordinates are given by *x0* and *dx* (the default behavior when
    /// `x` is not provided).
    /// 
    /// - Note:
    ///   Used by `Heatmap.xType`, `Heatmap.yType`, `Contour.xType`, `Contour.yType`, `HeatmapGL.xType`,
    ///   `HeatmapGL.yType`.
    public enum AxisType: String, Encodable {
        case array
        case scaled
    }

    /// Specifies the binning function used for this histogram trace.
    /// 
    /// If *count*, the histogram values are computed by counting the number of values lying inside each
    /// bin. If *sum*, *avg*, *min*, *max*, the histogram values are computed using the sum, the
    /// average, the minimum or the maximum of the values lying inside each bin respectively.
    /// 
    /// - Note:
    ///   Used by `Histogram.binningFunction`, `Histogram2D.binningFunction`,
    ///   `Histogram2DContour.binningFunction`.
    public enum BinningFunction: String, Encodable {
        case count
        case sum
        case avg
        case min
        case max
    }

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
    /// 
    /// - Note:
    ///   Used by `Histogram.normalization`, `Histogram2D.normalization`,
    ///   `Histogram2DContour.normalization`.
    public enum Normalization: String, Encodable {
        case off = ""
        case percent
        case probability
        case density
        case probabilityDensity = "probability density"
    }

    /// Sets the constraint operation.
    /// 
    /// *=* keeps regions equal to `value` *<* and *<=* keep regions less than `value` *>* and *>=* keep
    /// regions greater than `value` *[]*, *()*, *[)*, and *(]* keep regions inside `value[0]` to
    /// `value[1]` *][*, *)(*, *](*, *)[* keep regions outside `value[0]` to value[1]` Open vs. closed
    /// intervals make no difference to constraint display, but all versions are allowed for consistency
    /// with filter transforms.
    /// 
    /// - Note:
    ///   Used by `Shared.Contours.operation`, `Contour.Contours.operation`,
    ///   `ContourCarpet.Contours.operation`.
    public enum Operation: String, Encodable {
        case equalTo = "="
        case lessThan = "<"
        case greaterEqualThan = ">="
        case greaterThan = ">"
        case lessEqualThan = "<="
        case insideInclusive = "[]"
        case insideExclusive = "()"
        case insideInclusiveExclusive = "[)"
        case insideExclusiveInclusive = "(]"
        case outsideInclusive = "]["
        case outsideExclusive = ")("
        case outsideInclusiveExclusive = "]("
        case outsideExclusiveInclusive = ")["
    }

    /// Determines the line shape.
    /// 
    /// With *spline* the lines are drawn using spline interpolation. The other available values
    /// correspond to step-wise line shapes.
    /// 
    /// - Note:
    ///   Used by `Shared.ShapedSmoothDashedLine.shape`, `ScatterCarpet.ShapedSmoothDashedLine.shape`,
    ///   `ScatterPolar.ShapedSmoothDashedLine.shape`.
    public enum Shape: String, Encodable {
        case linear
        case spline
    }

    /// Sets the area to fill with a solid color.
    /// 
    /// Use with `fillcolor` if not *none*. scatterternary has a subset of the options available to
    /// scatter. *toself* connects the endpoints of the trace (or each segment of the trace if it has
    /// gaps) into a closed shape. *tonext* fills the space between two traces if one completely
    /// encloses the other (eg consecutive contour lines), and behaves like *toself* if there is no
    /// trace before it. *tonext* should not be used if one trace does not enclose the other.
    /// 
    /// - Note:
    ///   Used by `ScatterTernary.fill`, `ScatterCarpet.fill`, `ScatterPolar.fill`.
    public enum AreaFill: String, Encodable {
        case none
        case toSelf = "toself"
        case toNext = "tonext"
    }

    /// Sets the dash style of the lines.
    /// 
    /// - Note:
    ///   Used by `Scatter3D.DashedMarkerLine.dash`, `ScatterGL.ShapedDashedLine.dash`,
    ///   `ScatterPolarGL.ShapedDashedLine.dash`.
    public enum Dash: String, Encodable {
        case solid
        case dot
        case dash
        case longDash = "longdash"
        case dashDot = "dashdot"
        case longDashDot = "longdashdot"
    }

    /// Specifies the ordering logic for the categories in the dimension.
    /// 
    /// By default, plotly uses *trace*, which specifies the order that is present in the data supplied.
    /// Set `categoryorder` to *category ascending* or *category descending* if order should be
    /// determined by the alphanumerical order of the category names. Set `categoryorder` to *array* to
    /// derive the ordering from the attribute `categoryarray`. If a category is not found in the
    /// `categoryarray` array, the sorting behavior for that attribute will be identical to the *trace*
    /// mode. The unspecified categories will follow the categories in `categoryarray`.
    /// 
    /// - Note:
    ///   Used by `ParallelCategories.Dimension.categoryOrder`, `Carpet.AAxis.categoryOrder`,
    ///   `Carpet.BAxis.categoryOrder`.
    public enum CarpetCategoryOrder: String, Encodable {
        case trace
        case categoryAscending = "category ascending"
        case categoryDescending = "category descending"
        case array
    }

    /// Sets the unit of input *theta* values.
    /// 
    /// Has an effect only when on *linear* angular axes.
    /// 
    /// - Note:
    ///   Used by `ScatterPolar.thetaUnit`, `ScatterPolarGL.thetaUnit`, `BarPolar.thetaUnit`.
    public enum ThetaUnit: String, Encodable {
        case radians
        case degrees
        case gradians
    }

    
    // MARK: - FlagLists

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    /// 
    /// - Note:
    ///   Used by `Scatter.hoverInfo`, `Bar.hoverInfo`, `Box.hoverInfo`, `Heatmap.hoverInfo`,
    ///   `Histogram.hoverInfo`, `Histogram2D.hoverInfo`, `Histogram2DContour.hoverInfo`,
    ///   `Contour.hoverInfo`, `Violin.hoverInfo`, `Scatter3D.hoverInfo`, `Surface.hoverInfo`,
    ///   `Isosurface.hoverInfo`, `Volume.hoverInfo`, `Mesh3D.hoverInfo`, `ScatterGL.hoverInfo`,
    ///   `ScatterPlotMatrix.hoverInfo`, `PointCloud.hoverInfo`, `HeatmapGL.hoverInfo`, `Table.hoverInfo`,
    ///   `OHLC.hoverInfo`, `Candlestick.hoverInfo`.
    public struct HoverInfo: OptionSet, Encodable {
        public let rawValue: Int
        public static var x: HoverInfo { HoverInfo(rawValue: 1 << 0) }
        public static var y: HoverInfo { HoverInfo(rawValue: 1 << 1) }
        public static var z: HoverInfo { HoverInfo(rawValue: 1 << 2) }
        public static var text: HoverInfo { HoverInfo(rawValue: 1 << 3) }
        public static var name: HoverInfo { HoverInfo(rawValue: 1 << 4) }
        public static var all: HoverInfo { HoverInfo(rawValue: 1 << 5) }
        public static var none: HoverInfo { HoverInfo(rawValue: 1 << 6) }
        public static var skip: HoverInfo { HoverInfo(rawValue: 1 << 7) }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["x"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["y"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["z"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["name"] }
            if (self.rawValue & 1 << 5) != 0 { options += ["all"] }
            if (self.rawValue & 1 << 6) != 0 { options += ["none"] }
            if (self.rawValue & 1 << 7) != 0 { options += ["skip"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }

    /// Determines the drawing mode for this scatter trace.
    /// 
    /// If the provided `mode` includes *text* then the `text` elements appear at the coordinates.
    /// Otherwise, the `text` elements appear on hover. If there are less than 20 points and the trace
    /// is not stacked then the default is *lines+markers*. Otherwise, *lines*.
    /// 
    /// - Note:
    ///   Used by `Scatter.mode`, `ScatterTernary.mode`, `Scatter3D.mode`, `ScatterGeo.mode`,
    ///   `ScatterGL.mode`, `ScatterMapbox.mode`, `ScatterCarpet.mode`, `ScatterPolar.mode`,
    ///   `ScatterPolarGL.mode`.
    public struct Mode: OptionSet, Encodable {
        public let rawValue: Int
        public static var lines: Mode { Mode(rawValue: 1 << 0) }
        public static var markers: Mode { Mode(rawValue: 1 << 1) }
        public static var text: Mode { Mode(rawValue: 1 << 2) }
        public static var none: Mode { Mode(rawValue: 1 << 3) }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["lines"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["markers"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["none"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }

    /// Do the hover effects highlight individual points (markers or line points) or do they highlight
    /// filled regions? If the fill is *toself* or *tonext* and there are no markers or text, then the
    /// default is *fills*, otherwise it is *points*.
    /// 
    /// - Note:
    ///   Used by `Scatter.hoverOn`, `ScatterTernary.hoverOn`, `ScatterCarpet.hoverOn`,
    ///   `ScatterPolar.hoverOn`.
    public struct HoverOn: OptionSet, Encodable {
        public let rawValue: Int
        public static var points: HoverOn { HoverOn(rawValue: 1 << 0) }
        public static var fills: HoverOn { HoverOn(rawValue: 1 << 1) }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["points"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["fills"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    /// 
    /// - Note:
    ///   Used by `ScatterPolar.hoverInfo`, `ScatterPolarGL.hoverInfo`, `BarPolar.hoverInfo`.
    public struct PolarHoverInfo: OptionSet, Encodable {
        public let rawValue: Int
        public static var r: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 0) }
        public static var theta: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 1) }
        public static var text: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 2) }
        public static var name: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 3) }
        public static var all: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 4) }
        public static var none: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 5) }
        public static var skip: PolarHoverInfo { PolarHoverInfo(rawValue: 1 << 6) }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["r"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["theta"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["name"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["all"] }
            if (self.rawValue & 1 << 5) != 0 { options += ["none"] }
            if (self.rawValue & 1 << 6) != 0 { options += ["skip"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }

    
    // MARK: - Objects

    /// Sets the global font.
    /// 
    /// Note that fonts used in traces and other layout components inherit from the global font.
    /// 
    /// - Note:
    ///   Used by `Layout.font`, `Layout.Title.font`, `Shared.HoverLabel.font`, `Layout.XAxis.Title.font`,
    ///   `Layout.XAxis.tickFont`, `Layout.XAxis.RangeSelector.font`, `Layout.YAxis.Title.font`,
    ///   `Layout.YAxis.tickFont`, `Shared.Title.font`, `Layout.Ternary.AAxis.tickFont`,
    ///   `Layout.Ternary.BAxis.Title.font`, `Layout.Ternary.BAxis.tickFont`,
    ///   `Layout.Ternary.CAxis.Title.font`, `Layout.Ternary.CAxis.tickFont`,
    ///   `Layout.Scene.XAxis.Title.font`, `Layout.Scene.XAxis.tickFont`, `Layout.Scene.YAxis.Title.font`,
    ///   `Layout.Scene.YAxis.tickFont`, `Layout.Scene.ZAxis.Title.font`, `Layout.Scene.ZAxis.tickFont`,
    ///   `Layout.Scene.Annotation.font`, `Layout.Scene.Annotation.HoverLabel.font`,
    ///   `Layout.Mapbox.Layer.Symbol.textFont`, `Layout.Polar.RadialAxis.Title.font`,
    ///   `Layout.Polar.RadialAxis.tickFont`, `Layout.Polar.AngularAxis.tickFont`, `Layout.Legend.font`,
    ///   `Layout.Annotation.font`, `Layout.Annotation.HoverLabel.font`, `Layout.UpdateMenu.font`,
    ///   `Layout.Slider.CurrentValue.font`, `Layout.Slider.font`, `Shared.ColorBar.tickFont`,
    ///   `Shared.ColorBar.Title.font`, `Shared.GradientMarker.ColorBar.tickFont`,
    ///   `Shared.GradientMarker.ColorBar.Title.font`, `Shared.Marker.ColorBar.tickFont`,
    ///   `Shared.Marker.ColorBar.Title.font`, `Heatmap.ColorBar.tickFont`, `Heatmap.ColorBar.Title.font`,
    ///   `Histogram.Marker.ColorBar.tickFont`, `Histogram.Marker.ColorBar.Title.font`,
    ///   `Histogram2D.ColorBar.tickFont`, `Histogram2D.ColorBar.Title.font`, `Shared.Contours.labelFont`,
    ///   `Histogram2DContour.ColorBar.tickFont`, `Histogram2DContour.ColorBar.Title.font`,
    ///   `Contour.Contours.labelFont`, `Contour.ColorBar.tickFont`, `Contour.ColorBar.Title.font`,
    ///   `ScatterTernary.GradientMarker.ColorBar.tickFont`,
    ///   `ScatterTernary.GradientMarker.ColorBar.Title.font`, `Funnel.Marker.ColorBar.tickFont`,
    ///   `Funnel.Marker.ColorBar.Title.font`, `Sunburst.Marker.ColorBar.tickFont`,
    ///   `Sunburst.Marker.ColorBar.Title.font`, `Treemap.Marker.ColorBar.tickFont`,
    ///   `Treemap.Marker.ColorBar.Title.font`, `Scatter3D.DashedMarkerLine.ColorBar.tickFont`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.Title.font`, `Shared.SymbolicMarker.ColorBar.tickFont`,
    ///   `Shared.SymbolicMarker.ColorBar.Title.font`, `Surface.ColorBar.tickFont`,
    ///   `Surface.ColorBar.Title.font`, `Isosurface.ColorBar.tickFont`, `Isosurface.ColorBar.Title.font`,
    ///   `Volume.ColorBar.tickFont`, `Volume.ColorBar.Title.font`, `Mesh3D.ColorBar.tickFont`,
    ///   `Mesh3D.ColorBar.Title.font`, `Cone.ColorBar.tickFont`, `Cone.ColorBar.Title.font`,
    ///   `StreamTube.ColorBar.tickFont`, `StreamTube.ColorBar.Title.font`,
    ///   `ScatterGeo.GradientMarker.ColorBar.tickFont`, `ScatterGeo.GradientMarker.ColorBar.Title.font`,
    ///   `Choropleth.ColorBar.tickFont`, `Choropleth.ColorBar.Title.font`,
    ///   `ScatterGL.SymbolicMarker.ColorBar.tickFont`, `ScatterGL.SymbolicMarker.ColorBar.Title.font`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.tickFont`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.Title.font`, `HeatmapGL.ColorBar.tickFont`,
    ///   `HeatmapGL.ColorBar.Title.font`, `ParallelCoordinates.labelFont`,
    ///   `ParallelCoordinates.tickFont`, `ParallelCoordinates.rangeFont`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.tickFont`,
    ///   `ParallelCoordinates.MarkerLine.ColorBar.Title.font`, `ParallelCategories.labelFont`,
    ///   `ParallelCategories.tickFont`, `ParallelCategories.ShapedMarkerLine.ColorBar.tickFont`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.Title.font`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.tickFont`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.Title.font`, `ScatterMapbox.textFont`,
    ///   `ChoroplethMapbox.ColorBar.tickFont`, `ChoroplethMapbox.ColorBar.Title.font`,
    ///   `DensityMapbox.ColorBar.tickFont`, `DensityMapbox.ColorBar.Title.font`, `Sankey.textFont`,
    ///   `Indicator.Title.font`, `Indicator.Number.font`, `Indicator.Delta.font`,
    ///   `Indicator.Gauge.Axis.tickFont`, `Carpet.AAxis.Title.font`, `Carpet.AAxis.tickFont`,
    ///   `Carpet.BAxis.Title.font`, `Carpet.BAxis.tickFont`, `Carpet.font`,
    ///   `ScatterCarpet.GradientMarker.ColorBar.tickFont`,
    ///   `ScatterCarpet.GradientMarker.ColorBar.Title.font`, `ContourCarpet.Contours.labelFont`,
    ///   `ContourCarpet.ColorBar.tickFont`, `ContourCarpet.ColorBar.Title.font`,
    ///   `ScatterPolar.GradientMarker.ColorBar.tickFont`,
    ///   `ScatterPolar.GradientMarker.ColorBar.Title.font`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.tickFont`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.Title.font`, `BarPolar.Marker.ColorBar.tickFont`,
    ///   `BarPolar.Marker.ColorBar.Title.font`.
    public struct Font: Encodable {
        /// HTML font family - the typeface that will be applied by the web browser.
        /// 
        /// The web browser will only be able to apply a font if it is available on the system which it
        /// operates. Provide multiple font families, separated by commas, to indicate the preference in
        /// which to apply fonts if they aren't available on the system. The plotly service (at
        /// https://plot.ly or on-premise) generates images on a server, where only a select number of fonts
        /// are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,,
        /// *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*,
        /// *PT Sans Narrow*, *Raleway*, *Times New Roman*.
        public var family: String? = nil
    
        public var size: Double? = nil
    
        public var color: Color? = nil
    
        /// Creates `Font` object with specified properties.
        /// 
        /// - Parameters:
        ///   - family: HTML font family - the typeface that will be applied by the web browser.
        ///   - size:
        ///   - color:
        public init(family: String? = nil, size: Double? = nil, color: Color? = nil) {
            self.family = family
            self.size = size
            self.color = color
        }
        
    }

    /// Sets the padding of the title.
    /// 
    /// Each padding value only applies when the corresponding `xanchor`/`yanchor` value is set
    /// accordingly. E.g. for left padding to take effect, `xanchor` must be set to *left*. The same
    /// rule applies if `xanchor`/`yanchor` is determined automatically. Padding is muted if the
    /// respective anchor value is *middle*/*center*.
    /// 
    /// - Note:
    ///   Used by `Layout.Title.padding`, `Layout.UpdateMenu.padding`, `Layout.Slider.padding`,
    ///   `Treemap.Marker.padding`.
    public struct Padding: Encodable {
        /// The amount of padding (in px) along the top of the component.
        public var t: Double? = nil
    
        /// The amount of padding (in px) on the right side of the component.
        public var r: Double? = nil
    
        /// The amount of padding (in px) along the bottom of the component.
        public var b: Double? = nil
    
        /// The amount of padding (in px) on the left side of the component.
        public var l: Double? = nil
    
        /// Creates `Padding` object with specified properties.
        /// 
        /// - Parameters:
        ///   - t: The amount of padding (in px) along the top of the component.
        ///   - r: The amount of padding (in px) on the right side of the component.
        ///   - b: The amount of padding (in px) along the bottom of the component.
        ///   - l: The amount of padding (in px) on the left side of the component.
        public init(t: Double? = nil, r: Double? = nil, b: Double? = nil, l: Double? = nil) {
            self.t = t
            self.r = r
            self.b = b
            self.l = l
        }
        
    }

    /// - Note:
    ///   Used by `Layout.hoverLabel`, `Scatter.hoverLabel`, `Bar.hoverLabel`, `Box.hoverLabel`,
    ///   `Heatmap.hoverLabel`, `Histogram.hoverLabel`, `Histogram2D.hoverLabel`,
    ///   `Histogram2DContour.hoverLabel`, `Contour.hoverLabel`, `ScatterTernary.hoverLabel`,
    ///   `Violin.hoverLabel`, `Funnel.hoverLabel`, `Waterfall.hoverLabel`, `Image.hoverLabel`,
    ///   `Pie.hoverLabel`, `Sunburst.hoverLabel`, `Treemap.hoverLabel`, `FunnelArea.hoverLabel`,
    ///   `Scatter3D.hoverLabel`, `Surface.hoverLabel`, `Isosurface.hoverLabel`, `Volume.hoverLabel`,
    ///   `Mesh3D.hoverLabel`, `Cone.hoverLabel`, `StreamTube.hoverLabel`, `ScatterGeo.hoverLabel`,
    ///   `Choropleth.hoverLabel`, `ScatterGL.hoverLabel`, `ScatterPlotMatrix.hoverLabel`,
    ///   `PointCloud.hoverLabel`, `HeatmapGL.hoverLabel`, `ScatterMapbox.hoverLabel`,
    ///   `ChoroplethMapbox.hoverLabel`, `DensityMapbox.hoverLabel`, `Sankey.hoverLabel`,
    ///   `Sankey.Node.hoverLabel`, `Sankey.Link.hoverLabel`, `Table.hoverLabel`,
    ///   `ScatterCarpet.hoverLabel`, `ScatterPolar.hoverLabel`, `ScatterPolarGL.hoverLabel`,
    ///   `BarPolar.hoverLabel`.
    public struct HoverLabel: Encodable {
        /// Sets the background color of all hover labels on graph
        public var backgroundColor: Color? = nil
    
        /// Sets the border color of all hover labels on graph.
        public var borderColor: Color? = nil
    
        /// Sets the default hover label font used by all traces on the graph.
        public var font: Shared.Font? = nil
    
        /// Sets the horizontal alignment of the text content within hover label box.
        /// 
        /// Has an effect only if the hover label text spans more two or more lines
        public var align: Shared.AutoAlign? = nil
    
        /// Sets the default length (in number of characters) of the trace name in the hover labels for all
        /// traces.
        /// 
        /// -1 shows the whole name regardless of length. 0-3 shows the first 0-3 characters, and an integer
        /// >3 will show the whole name if it is less than that many characters, but if it is longer, will
        /// truncate to `namelength - 3` characters and add an ellipsis.
        public var nameLength: Int? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case backgroundColor = "bgcolor"
            case borderColor = "bordercolor"
            case font
            case align
            case nameLength = "namelength"
        }
        
        /// Creates `HoverLabel` object with specified properties.
        /// 
        /// - Parameters:
        ///   - backgroundColor: Sets the background color of all hover labels on graph
        ///   - borderColor: Sets the border color of all hover labels on graph.
        ///   - font: Sets the default hover label font used by all traces on the graph.
        ///   - align: Sets the horizontal alignment of the text content within hover label box.
        ///   - nameLength: Sets the default length (in number of characters) of the trace name in the hover
        ///   labels for all traces.
        public init(backgroundColor: Color? = nil, borderColor: Color? = nil, font: Shared.Font? = nil,
                align: Shared.AutoAlign? = nil, nameLength: Int? = nil) {
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.font = font
            self.align = align
            self.nameLength = nameLength
        }
        
    }

    /// - Note:
    ///   Used by `Layout.XAxis.tickFormatStops`, `Layout.YAxis.tickFormatStops`,
    ///   `Layout.Ternary.AAxis.tickFormatStops`, `Layout.Ternary.BAxis.tickFormatStops`,
    ///   `Layout.Ternary.CAxis.tickFormatStops`, `Layout.Scene.XAxis.tickFormatStops`,
    ///   `Layout.Scene.YAxis.tickFormatStops`, `Layout.Scene.ZAxis.tickFormatStops`,
    ///   `Layout.Polar.RadialAxis.tickFormatStops`, `Layout.Polar.AngularAxis.tickFormatStops`,
    ///   `Shared.ColorBar.tickFormatStops`, `Shared.GradientMarker.ColorBar.tickFormatStops`,
    ///   `Shared.Marker.ColorBar.tickFormatStops`, `Heatmap.ColorBar.tickFormatStops`,
    ///   `Histogram.Marker.ColorBar.tickFormatStops`, `Histogram2D.ColorBar.tickFormatStops`,
    ///   `Histogram2DContour.ColorBar.tickFormatStops`, `Contour.ColorBar.tickFormatStops`,
    ///   `ScatterTernary.GradientMarker.ColorBar.tickFormatStops`,
    ///   `Funnel.Marker.ColorBar.tickFormatStops`, `Sunburst.Marker.ColorBar.tickFormatStops`,
    ///   `Treemap.Marker.ColorBar.tickFormatStops`,
    ///   `Scatter3D.DashedMarkerLine.ColorBar.tickFormatStops`,
    ///   `Shared.SymbolicMarker.ColorBar.tickFormatStops`, `Surface.ColorBar.tickFormatStops`,
    ///   `Isosurface.ColorBar.tickFormatStops`, `Volume.ColorBar.tickFormatStops`,
    ///   `Mesh3D.ColorBar.tickFormatStops`, `Cone.ColorBar.tickFormatStops`,
    ///   `StreamTube.ColorBar.tickFormatStops`, `ScatterGeo.GradientMarker.ColorBar.tickFormatStops`,
    ///   `Choropleth.ColorBar.tickFormatStops`, `ScatterGL.SymbolicMarker.ColorBar.tickFormatStops`,
    ///   `ScatterPlotMatrix.SymbolicMarker.ColorBar.tickFormatStops`,
    ///   `HeatmapGL.ColorBar.tickFormatStops`, `ParallelCoordinates.MarkerLine.ColorBar.tickFormatStops`,
    ///   `ParallelCategories.ShapedMarkerLine.ColorBar.tickFormatStops`,
    ///   `ScatterMapbox.SymbolicMarker.ColorBar.tickFormatStops`,
    ///   `ChoroplethMapbox.ColorBar.tickFormatStops`, `DensityMapbox.ColorBar.tickFormatStops`,
    ///   `Indicator.Gauge.Axis.tickFormatStops`, `Carpet.AAxis.tickFormatStops`,
    ///   `Carpet.BAxis.tickFormatStops`, `ScatterCarpet.GradientMarker.ColorBar.tickFormatStops`,
    ///   `ContourCarpet.ColorBar.tickFormatStops`,
    ///   `ScatterPolar.GradientMarker.ColorBar.tickFormatStops`,
    ///   `ScatterPolarGL.SymbolicMarker.ColorBar.tickFormatStops`,
    ///   `BarPolar.Marker.ColorBar.tickFormatStops`.
    public struct TickFormatStop: Encodable {
        /// Determines whether or not this stop is used.
        /// 
        /// If `false`, this stop is ignored even within its `dtickrange`.
        public var enabled: Bool? = nil
    
        /// range [*min*, *max*], where *min*, *max* - dtick values which describe some zoom level, it is
        /// possible to omit *min* or *max* value by passing *null*
        public var dTickRange: InfoArray? = nil
    
        /// string - dtickformat for described zoom level, the same as *tickformat*
        public var value: String? = nil
    
        /// When used in a template, named items are created in the output figure in addition to any items
        /// the figure already has in this array.
        /// 
        /// You can modify these items in the output figure by making your own item with `templateitemname`
        /// matching this `name` alongside your modifications (including `visible: false` or `enabled:
        /// false` to hide it). Has no effect outside of a template.
        public var name: String? = nil
    
        /// Used to refer to a named item in this array in the template.
        /// 
        /// Named items from the template will be created even without a matching item in the input figure,
        /// but you can modify one by making an item with `templateitemname` matching its `name`, alongside
        /// your modifications (including `visible: false` or `enabled: false` to hide it). If there is no
        /// template or no matching item, this item will be hidden unless you explicitly show it with
        /// `visible: true`.
        public var templateItemName: String? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case enabled
            case dTickRange = "dtickrange"
            case value
            case name
            case templateItemName = "templateitemname"
        }
        
        /// Creates `TickFormatStop` object with specified properties.
        /// 
        /// - Parameters:
        ///   - enabled: Determines whether or not this stop is used.
        ///   - dTickRange: range [*min*, *max*], where *min*, *max* - dtick values which describe some zoom
        ///   level, it is possible to omit *min* or *max* value by passing *null*
        ///   - value: string - dtickformat for described zoom level, the same as *tickformat*
        ///   - name: When used in a template, named items are created in the output figure in addition to any
        ///   items the figure already has in this array.
        ///   - templateItemName: Used to refer to a named item in this array in the template.
        public init(enabled: Bool? = nil, dTickRange: InfoArray? = nil, value: String? = nil, name:
                String? = nil, templateItemName: String? = nil) {
            self.enabled = enabled
            self.dTickRange = dTickRange
            self.value = value
            self.name = name
            self.templateItemName = templateItemName
        }
        
    }

    /// - Note:
    ///   Used by `Layout.Ternary.domain`, `Layout.Scene.domain`, `Layout.Geo.domain`,
    ///   `Layout.Mapbox.domain`, `Layout.Polar.domain`, `Pie.domain`, `Sunburst.domain`,
    ///   `Treemap.domain`, `FunnelArea.domain`, `ParallelCoordinates.domain`,
    ///   `ParallelCategories.domain`, `Sankey.domain`, `Indicator.domain`, `Table.domain`.
    public struct Domain: Encodable {
        /// Sets the horizontal domain of this ternary subplot (in plot fraction).
        public var x: InfoArray? = nil
    
        /// Sets the vertical domain of this ternary subplot (in plot fraction).
        public var y: InfoArray? = nil
    
        /// If there is a layout grid, use the domain for this row in the grid for this ternary subplot .
        public var row: Int? = nil
    
        /// If there is a layout grid, use the domain for this column in the grid for this ternary subplot .
        public var column: Int? = nil
    
        /// Creates `Domain` object with specified properties.
        /// 
        /// - Parameters:
        ///   - x: Sets the horizontal domain of this ternary subplot (in plot fraction).
        ///   - y: Sets the vertical domain of this ternary subplot (in plot fraction).
        ///   - row: If there is a layout grid, use the domain for this row in the grid for this ternary
        ///   subplot .
        ///   - column: If there is a layout grid, use the domain for this column in the grid for this ternary
        ///   subplot .
        public init(x: InfoArray? = nil, y: InfoArray? = nil, row: Int? = nil, column: Int? = nil) {
            self.x = x
            self.y = y
            self.row = row
            self.column = column
        }
        
    }

    /// - Note:
    ///   Used by `Layout.Ternary.AAxis.title`, `Layout.Ternary.BAxis.title`,
    ///   `Layout.Ternary.CAxis.title`, `Layout.Scene.XAxis.title`, `Layout.Scene.YAxis.title`,
    ///   `Layout.Scene.ZAxis.title`, `Layout.Polar.RadialAxis.title`.
    public struct Title: Encodable {
        /// Sets the title of this axis.
        /// 
        /// Note that before the existence of `title.text`, the title's contents used to be defined as the
        /// `title` attribute itself. This behavior has been deprecated.
        public var text: String? = nil
    
        /// Sets this axis' title font.
        /// 
        /// Note that the title's font used to be customized by the now deprecated `titlefont` attribute.
        public var font: Shared.Font? = nil
    
        /// Creates `Title` object with specified properties.
        /// 
        /// - Parameters:
        ///   - text: Sets the title of this axis.
        ///   - font: Sets this axis' title font.
        public init(text: String? = nil, font: Shared.Font? = nil) {
            self.text = text
            self.font = font
        }
        
    }

    /// - Note:
    ///   Used by `Layout.Shape.line`, `Funnel.Connector.line`, `Waterfall.Connector.line`,
    ///   `ScatterGeo.line`.
    public struct DashedLine: Encodable {
        /// Sets the line color.
        public var color: Color? = nil
    
        /// Sets the line width (in px).
        public var width: Double? = nil
    
        /// Sets the dash style of lines.
        /// 
        /// Set to a dash type string (*solid*, *dot*, *dash*, *longdash*, *dashdot*, or *longdashdot*) or a
        /// dash length list in px (eg *5px,10px,2px,2px*).
        public var dash: String? = nil
    
        /// Creates `DashedLine` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets the line color.
        ///   - width: Sets the line width (in px).
        ///   - dash: Sets the dash style of lines.
        public init(color: Color? = nil, width: Double? = nil, dash: String? = nil) {
            self.color = color
            self.width = width
            self.dash = dash
        }
        
    }

    /// - Note:
    ///   Used by `Layout.ColorAxis.colorBar`, `Shared.GradientMarker.colorBar`, `Shared.Marker.colorBar`,
    ///   `Heatmap.colorBar`, `Histogram.Marker.colorBar`, `Histogram2D.colorBar`,
    ///   `Histogram2DContour.colorBar`, `Contour.colorBar`, `ScatterTernary.GradientMarker.colorBar`,
    ///   `Funnel.Marker.colorBar`, `Sunburst.Marker.colorBar`, `Treemap.Marker.colorBar`,
    ///   `Scatter3D.DashedMarkerLine.colorBar`, `Shared.SymbolicMarker.colorBar`, `Surface.colorBar`,
    ///   `Isosurface.colorBar`, `Volume.colorBar`, `Mesh3D.colorBar`, `Cone.colorBar`,
    ///   `StreamTube.colorBar`, `ScatterGeo.GradientMarker.colorBar`, `Choropleth.colorBar`,
    ///   `ScatterGL.SymbolicMarker.colorBar`, `ScatterPlotMatrix.SymbolicMarker.colorBar`,
    ///   `HeatmapGL.colorBar`, `ParallelCoordinates.MarkerLine.colorBar`,
    ///   `ParallelCategories.ShapedMarkerLine.colorBar`, `ScatterMapbox.SymbolicMarker.colorBar`,
    ///   `ChoroplethMapbox.colorBar`, `DensityMapbox.colorBar`, `ScatterCarpet.GradientMarker.colorBar`,
    ///   `ContourCarpet.colorBar`, `ScatterPolar.GradientMarker.colorBar`,
    ///   `ScatterPolarGL.SymbolicMarker.colorBar`, `BarPolar.Marker.colorBar`.
    public struct ColorBar: Encodable {
        /// Determines whether this color bar's thickness (i.e.
        /// 
        /// the measure in the constant color direction) is set in units of plot *fraction* or in *pixels*.
        /// Use `thickness` to set the value.
        public var thicknessMode: Shared.ThicknessMode? = nil
    
        /// Sets the thickness of the color bar This measure excludes the size of the padding, ticks and
        /// labels.
        public var thickness: Double? = nil
    
        /// Determines whether this color bar's length (i.e.
        /// 
        /// the measure in the color variation direction) is set in units of plot *fraction* or in *pixels.
        /// Use `len` to set the value.
        public var lengthMode: Shared.LengthMode? = nil
    
        /// Sets the length of the color bar This measure excludes the padding of both ends.
        /// 
        /// That is, the color bar length is this length minus the padding on both ends.
        public var length: Double? = nil
    
        /// Sets the x position of the color bar (in plot fraction).
        public var x: Double? = nil
    
        /// Sets this color bar's horizontal position anchor.
        /// 
        /// This anchor binds the `x` position to the *left*, *center* or *right* of the color bar.
        public var xAnchor: Shared.XAnchor? = nil
    
        /// Sets the amount of padding (in px) along the x direction.
        public var xPadding: Double? = nil
    
        /// Sets the y position of the color bar (in plot fraction).
        public var y: Double? = nil
    
        /// Sets this color bar's vertical position anchor This anchor binds the `y` position to the *top*,
        /// *middle* or *bottom* of the color bar.
        public var yAnchor: Shared.YAnchor? = nil
    
        /// Sets the amount of padding (in px) along the y direction.
        public var yPading: Double? = nil
    
        /// Sets the axis line color.
        public var outlineColor: Color? = nil
    
        /// Sets the width (in px) of the axis line.
        public var outlineWidth: Double? = nil
    
        /// Sets the axis line color.
        public var borderColor: Color? = nil
    
        /// Sets the width (in px) or the border enclosing this color bar.
        public var borderWidth: Double? = nil
    
        /// Sets the color of padded area.
        public var backgroundColor: Color? = nil
    
        /// Sets the tick mode for this axis.
        /// 
        /// If *auto*, the number of ticks is set via `nticks`. If *linear*, the placement of the ticks is
        /// determined by a starting position `tick0` and a tick step `dtick` (*linear* is the default value
        /// if `tick0` and `dtick` are provided). If *array*, the placement of the ticks is set via
        /// `tickvals` and the tick text is `ticktext`. (*array* is the default value if `tickvals` is
        /// provided).
        public var tickMode: Shared.TickMode? = nil
    
        /// Specifies the maximum number of ticks for the particular axis.
        /// 
        /// The actual number of ticks will be chosen automatically to be less than or equal to `nticks`.
        /// Has an effect only if `tickmode` is set to *auto*.
        public var numTicks: Int? = nil
    
        /// Sets the placement of the first tick on this axis.
        /// 
        /// Use with `dtick`. If the axis `type` is *log*, then you must take the log of your starting tick
        /// (e.g. to set the starting tick to 100, set the `tick0` to 2) except when `dtick`=*L<f>* (see
        /// `dtick` for more info). If the axis `type` is *date*, it should be a date string, like date
        /// data. If the axis `type` is *category*, it should be a number, using the scale where each
        /// category is assigned a serial number from zero in the order it appears.
        public var tick0: Anything? = nil
    
        /// Sets the step in-between ticks on this axis.
        /// 
        /// Use with `tick0`. Must be a positive number, or special strings available to *log* and *date*
        /// axes. If the axis `type` is *log*, then ticks are set every 10^(n*dtick) where n is the tick
        /// number. For example, to set a tick mark at 1, 10, 100, 1000, ... set dtick to 1. To set tick
        /// marks at 1, 100, 10000, ... set dtick to 2. To set tick marks at 1, 5, 25, 125, 625, 3125, ...
        /// set dtick to log_10(5), or 0.69897000433. *log* has several special values; *L<f>*, where `f` is
        /// a positive number, gives ticks linearly spaced in value (but not position). For example `tick0`
        /// = 0.1, `dtick` = *L0.5* will put ticks at 0.1, 0.6, 1.1, 1.6 etc. To show powers of 10 plus
        /// small digits between, use *D1* (all digits) or *D2* (only 2 and 5). `tick0` is ignored for *D1*
        /// and *D2*. If the axis `type` is *date*, then you must convert the time to milliseconds. For
        /// example, to set the interval between ticks to one day, set `dtick` to 86400000.0. *date* also
        /// has special values *M<n>* gives ticks spaced by a number of months. `n` must be a positive
        /// integer. To set ticks on the 15th of every third month, set `tick0` to *2000-01-15* and `dtick`
        /// to *M3*. To set ticks every 4 years, set `dtick` to *M48*
        public var dTick: Anything? = nil
    
        /// Sets the values at which ticks on this axis appear.
        /// 
        /// Only has an effect if `tickmode` is set to *array*. Used with `ticktext`.
        public var tickValues: [Double]? = nil
    
        /// Sets the text displayed at the ticks position via `tickvals`.
        /// 
        /// Only has an effect if `tickmode` is set to *array*. Used with `tickvals`.
        public var tickText: [Double]? = nil
    
        /// Determines whether ticks are drawn or not.
        /// 
        /// If **, this axis' ticks are not drawn. If *outside* (*inside*), this axis' are drawn outside
        /// (inside) the axis lines.
        public var ticks: Shared.Ticks? = nil
    
        /// Sets the tick length (in px).
        public var tickLength: Double? = nil
    
        /// Sets the tick width (in px).
        public var tickWidth: Double? = nil
    
        /// Sets the tick color.
        public var tickColor: Color? = nil
    
        /// Determines whether or not the tick labels are drawn.
        public var showTickLabels: Bool? = nil
    
        /// Sets the color bar's tick label font
        public var tickFont: Shared.Font? = nil
    
        /// Sets the angle of the tick labels with respect to the horizontal.
        /// 
        /// For example, a `tickangle` of -90 draws the tick labels vertically.
        public var tickAngle: Angle? = nil
    
        /// Sets the tick label formatting rule using d3 formatting mini-languages which are very similar to
        /// those in Python.
        /// 
        /// For numbers, see: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
        /// And for dates see:
        /// https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format We add one item
        /// to d3's date formatter: *%{n}f* for fractional seconds with n digits. For example, *2016-10-13
        /// 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*
        public var tickFormat: String? = nil
    
        public var tickFormatStops: [Shared.TickFormatStop]? = nil
    
        /// Sets a tick label prefix.
        public var tickPrefix: String? = nil
    
        /// If *all*, all tick labels are displayed with a prefix.
        /// 
        /// If *first*, only the first tick is displayed with a prefix. If *last*, only the last tick is
        /// displayed with a suffix. If *none*, tick prefixes are hidden.
        public var showTickPrefix: Shared.ShowTickPrefix? = nil
    
        /// Sets a tick label suffix.
        public var tickSuffix: String? = nil
    
        /// Same as `showtickprefix` but for tick suffixes.
        public var showTickSuffix: Shared.ShowTickSuffix? = nil
    
        /// If "true", even 4-digit integers are separated
        public var separateThousands: Bool? = nil
    
        /// Determines a formatting rule for the tick exponents.
        /// 
        /// For example, consider the number 1,000,000,000. If *none*, it appears as 1,000,000,000. If *e*,
        /// 1e+9. If *E*, 1E+9. If *power*, 1x10^9 (with 9 in a super script). If *SI*, 1G. If *B*, 1B.
        public var exponentFormat: Shared.ExponentFormat? = nil
    
        /// If *all*, all exponents are shown besides their significands.
        /// 
        /// If *first*, only the exponent of the first tick is shown. If *last*, only the exponent of the
        /// last tick is shown. If *none*, no exponents appear.
        public var showExponent: Shared.ShowExponent? = nil
    
        public struct Title: Encodable {
            /// Sets the title of the color bar.
            /// 
            /// Note that before the existence of `title.text`, the title's contents used to be defined as the
            /// `title` attribute itself. This behavior has been deprecated.
            public var text: String? = nil
        
            /// Sets this color bar's title font.
            /// 
            /// Note that the title's font used to be set by the now deprecated `titlefont` attribute.
            public var font: Shared.Font? = nil
        
            /// Determines the location of color bar's title with respect to the color bar.
            /// 
            /// Note that the title's location used to be set by the now deprecated `titleside` attribute.
            public var side: Shared.Side? = nil
        
            /// Creates `Title` object with specified properties.
            /// 
            /// - Parameters:
            ///   - text: Sets the title of the color bar.
            ///   - font: Sets this color bar's title font.
            ///   - side: Determines the location of color bar's title with respect to the color bar.
            public init(text: String? = nil, font: Shared.Font? = nil, side: Shared.Side? = nil) {
                self.text = text
                self.font = font
                self.side = side
            }
            
        }
        public var title: Title? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case thicknessMode = "thicknessmode"
            case thickness
            case lengthMode = "lenmode"
            case length = "len"
            case x
            case xAnchor = "xanchor"
            case xPadding = "xpad"
            case y
            case yAnchor = "yanchor"
            case yPading = "ypad"
            case outlineColor = "outlinecolor"
            case outlineWidth = "outlinewidth"
            case borderColor = "bordercolor"
            case borderWidth = "borderwidth"
            case backgroundColor = "bgcolor"
            case tickMode = "tickmode"
            case numTicks = "nticks"
            case tick0
            case dTick = "dtick"
            case tickValues = "tickvals"
            case tickText = "ticktext"
            case ticks
            case tickLength = "ticklen"
            case tickWidth = "tickwidth"
            case tickColor = "tickcolor"
            case showTickLabels = "showticklabels"
            case tickFont = "tickfont"
            case tickAngle = "tickangle"
            case tickFormat = "tickformat"
            case tickFormatStops = "tickformatstops"
            case tickPrefix = "tickprefix"
            case showTickPrefix = "showtickprefix"
            case tickSuffix = "ticksuffix"
            case showTickSuffix = "showticksuffix"
            case separateThousands = "separatethousands"
            case exponentFormat = "exponentformat"
            case showExponent = "showexponent"
            case title
        }
        
        /// Creates `ColorBar` object with specified properties.
        /// 
        /// - Parameters:
        ///   - thicknessMode: Determines whether this color bar's thickness (i.e.
        ///   - thickness: Sets the thickness of the color bar This measure excludes the size of the padding,
        ///   ticks and labels.
        ///   - lengthMode: Determines whether this color bar's length (i.e.
        ///   - length: Sets the length of the color bar This measure excludes the padding of both ends.
        ///   - x: Sets the x position of the color bar (in plot fraction).
        ///   - xAnchor: Sets this color bar's horizontal position anchor.
        ///   - xPadding: Sets the amount of padding (in px) along the x direction.
        ///   - y: Sets the y position of the color bar (in plot fraction).
        ///   - yAnchor: Sets this color bar's vertical position anchor This anchor binds the `y` position to
        ///   the *top*, *middle* or *bottom* of the color bar.
        ///   - yPading: Sets the amount of padding (in px) along the y direction.
        ///   - outlineColor: Sets the axis line color.
        ///   - outlineWidth: Sets the width (in px) of the axis line.
        ///   - borderColor: Sets the axis line color.
        ///   - borderWidth: Sets the width (in px) or the border enclosing this color bar.
        ///   - backgroundColor: Sets the color of padded area.
        ///   - tickMode: Sets the tick mode for this axis.
        ///   - numTicks: Specifies the maximum number of ticks for the particular axis.
        ///   - tick0: Sets the placement of the first tick on this axis.
        ///   - dTick: Sets the step in-between ticks on this axis.
        ///   - tickValues: Sets the values at which ticks on this axis appear.
        ///   - tickText: Sets the text displayed at the ticks position via `tickvals`.
        ///   - ticks: Determines whether ticks are drawn or not.
        ///   - tickLength: Sets the tick length (in px).
        ///   - tickWidth: Sets the tick width (in px).
        ///   - tickColor: Sets the tick color.
        ///   - showTickLabels: Determines whether or not the tick labels are drawn.
        ///   - tickFont: Sets the color bar's tick label font
        ///   - tickAngle: Sets the angle of the tick labels with respect to the horizontal.
        ///   - tickFormat: Sets the tick label formatting rule using d3 formatting mini-languages which are
        ///   very similar to those in Python.
        ///   - tickFormatStops:
        ///   - tickPrefix: Sets a tick label prefix.
        ///   - showTickPrefix: If *all*, all tick labels are displayed with a prefix.
        ///   - tickSuffix: Sets a tick label suffix.
        ///   - showTickSuffix: Same as `showtickprefix` but for tick suffixes.
        ///   - separateThousands: If "true", even 4-digit integers are separated
        ///   - exponentFormat: Determines a formatting rule for the tick exponents.
        ///   - showExponent: If *all*, all exponents are shown besides their significands.
        ///   - title:
        public init(thicknessMode: Shared.ThicknessMode? = nil, thickness: Double? = nil, lengthMode:
                Shared.LengthMode? = nil, length: Double? = nil, x: Double? = nil, xAnchor: Shared.XAnchor? =
                nil, xPadding: Double? = nil, y: Double? = nil, yAnchor: Shared.YAnchor? = nil, yPading: Double?
                = nil, outlineColor: Color? = nil, outlineWidth: Double? = nil, borderColor: Color? = nil,
                borderWidth: Double? = nil, backgroundColor: Color? = nil, tickMode: Shared.TickMode? = nil,
                numTicks: Int? = nil, tick0: Anything? = nil, dTick: Anything? = nil, tickValues: [Double]? =
                nil, tickText: [Double]? = nil, ticks: Shared.Ticks? = nil, tickLength: Double? = nil,
                tickWidth: Double? = nil, tickColor: Color? = nil, showTickLabels: Bool? = nil, tickFont:
                Shared.Font? = nil, tickAngle: Angle? = nil, tickFormat: String? = nil, tickFormatStops:
                [Shared.TickFormatStop]? = nil, tickPrefix: String? = nil, showTickPrefix:
                Shared.ShowTickPrefix? = nil, tickSuffix: String? = nil, showTickSuffix: Shared.ShowTickSuffix?
                = nil, separateThousands: Bool? = nil, exponentFormat: Shared.ExponentFormat? = nil,
                showExponent: Shared.ShowExponent? = nil, title: Title? = nil) {
            self.thicknessMode = thicknessMode
            self.thickness = thickness
            self.lengthMode = lengthMode
            self.length = length
            self.x = x
            self.xAnchor = xAnchor
            self.xPadding = xPadding
            self.y = y
            self.yAnchor = yAnchor
            self.yPading = yPading
            self.outlineColor = outlineColor
            self.outlineWidth = outlineWidth
            self.borderColor = borderColor
            self.borderWidth = borderWidth
            self.backgroundColor = backgroundColor
            self.tickMode = tickMode
            self.numTicks = numTicks
            self.tick0 = tick0
            self.dTick = dTick
            self.tickValues = tickValues
            self.tickText = tickText
            self.ticks = ticks
            self.tickLength = tickLength
            self.tickWidth = tickWidth
            self.tickColor = tickColor
            self.showTickLabels = showTickLabels
            self.tickFont = tickFont
            self.tickAngle = tickAngle
            self.tickFormat = tickFormat
            self.tickFormatStops = tickFormatStops
            self.tickPrefix = tickPrefix
            self.showTickPrefix = showTickPrefix
            self.tickSuffix = tickSuffix
            self.showTickSuffix = showTickSuffix
            self.separateThousands = separateThousands
            self.exponentFormat = exponentFormat
            self.showExponent = showExponent
            self.title = title
        }
        
    }

    /// Sets the font used in hover labels.
    /// 
    /// - Note:
    ///   Used by `Scatter.HoverLabel.font`, `Scatter.textFont`, `Bar.HoverLabel.font`, `Bar.textFont`,
    ///   `Bar.insideTextFont`, `Box.HoverLabel.font`, `Heatmap.HoverLabel.font`,
    ///   `Histogram.HoverLabel.font`, `Histogram2D.HoverLabel.font`,
    ///   `Histogram2DContour.HoverLabel.font`, `Contour.HoverLabel.font`,
    ///   `ScatterTernary.HoverLabel.font`, `ScatterTernary.textFont`, `Violin.HoverLabel.font`,
    ///   `Funnel.HoverLabel.font`, `Funnel.textFont`, `Funnel.insideTextFont`,
    ///   `Waterfall.HoverLabel.font`, `Waterfall.textFont`, `Waterfall.insideTextFont`,
    ///   `Image.HoverLabel.font`, `Pie.HoverLabel.font`, `Pie.textFont`, `Pie.insideTextFont`,
    ///   `Pie.Title.font`, `Sunburst.HoverLabel.font`, `Sunburst.textFont`, `Sunburst.insideTextFont`,
    ///   `Treemap.HoverLabel.font`, `Treemap.PathBar.textFont`, `Treemap.textFont`,
    ///   `Treemap.insideTextFont`, `FunnelArea.HoverLabel.font`, `FunnelArea.textFont`,
    ///   `FunnelArea.insideTextFont`, `FunnelArea.Title.font`, `Scatter3D.HoverLabel.font`,
    ///   `Scatter3D.textFont`, `Surface.HoverLabel.font`, `Isosurface.HoverLabel.font`,
    ///   `Volume.HoverLabel.font`, `Mesh3D.HoverLabel.font`, `Cone.HoverLabel.font`,
    ///   `StreamTube.HoverLabel.font`, `ScatterGeo.HoverLabel.font`, `ScatterGeo.textFont`,
    ///   `Choropleth.HoverLabel.font`, `ScatterGL.HoverLabel.font`, `ScatterGL.textFont`,
    ///   `ScatterPlotMatrix.HoverLabel.font`, `PointCloud.HoverLabel.font`, `HeatmapGL.HoverLabel.font`,
    ///   `ScatterMapbox.HoverLabel.font`, `ChoroplethMapbox.HoverLabel.font`,
    ///   `DensityMapbox.HoverLabel.font`, `Sankey.HoverLabel.font`, `Sankey.Node.HoverLabel.font`,
    ///   `Sankey.Link.HoverLabel.font`, `Table.HoverLabel.font`, `Table.Header.font`, `Table.Cells.font`,
    ///   `ScatterCarpet.HoverLabel.font`, `ScatterCarpet.textFont`, `OHLC.HoverLabel.font`,
    ///   `Candlestick.HoverLabel.font`, `ScatterPolar.HoverLabel.font`, `ScatterPolar.textFont`,
    ///   `ScatterPolarGL.HoverLabel.font`, `ScatterPolarGL.textFont`, `BarPolar.HoverLabel.font`.
    public struct VariableFont: Encodable {
        /// HTML font family - the typeface that will be applied by the web browser.
        /// 
        /// The web browser will only be able to apply a font if it is available on the system which it
        /// operates. Provide multiple font families, separated by commas, to indicate the preference in
        /// which to apply fonts if they aren't available on the system. The plotly service (at
        /// https://plot.ly or on-premise) generates images on a server, where only a select number of fonts
        /// are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,,
        /// *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*,
        /// *PT Sans Narrow*, *Raleway*, *Times New Roman*.
        public var family: Data<String>? = nil
    
        public var size: Data<Double>? = nil
    
        public var coloring: Coloring? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case family
            case size
            case coloring = "color"
        }
        
        /// Creates `VariableFont` object with specified properties.
        /// 
        /// - Parameters:
        ///   - family: HTML font family - the typeface that will be applied by the web browser.
        ///   - size:
        ///   - coloring:
        public init(family: Data<String>? = nil, size: Data<Double>? = nil, coloring: Coloring? = nil) {
            self.family = family
            self.size = size
            self.coloring = coloring
        }
        
    }

    /// - Note:
    ///   Used by `Scatter.stream`, `Bar.stream`, `Box.stream`, `Heatmap.stream`, `Histogram.stream`,
    ///   `Histogram2D.stream`, `Histogram2DContour.stream`, `Contour.stream`, `ScatterTernary.stream`,
    ///   `Violin.stream`, `Funnel.stream`, `Waterfall.stream`, `Image.stream`, `Pie.stream`,
    ///   `Sunburst.stream`, `Treemap.stream`, `FunnelArea.stream`, `Scatter3D.stream`, `Surface.stream`,
    ///   `Isosurface.stream`, `Volume.stream`, `Mesh3D.stream`, `Cone.stream`, `StreamTube.stream`,
    ///   `ScatterGeo.stream`, `Choropleth.stream`, `ScatterGL.stream`, `ScatterPlotMatrix.stream`,
    ///   `PointCloud.stream`, `HeatmapGL.stream`, `ParallelCoordinates.stream`,
    ///   `ParallelCategories.stream`, `ScatterMapbox.stream`, `ChoroplethMapbox.stream`,
    ///   `DensityMapbox.stream`, `Sankey.stream`, `Indicator.stream`, `Table.stream`, `Carpet.stream`,
    ///   `ScatterCarpet.stream`, `ContourCarpet.stream`, `OHLC.stream`, `Candlestick.stream`,
    ///   `ScatterPolar.stream`, `ScatterPolarGL.stream`, `BarPolar.stream`.
    public struct Stream: Encodable {
        /// The stream id number links a data trace on a plot with a stream.
        /// 
        /// See https://plot.ly/settings for more details.
        public var token: String? = nil
    
        /// Sets the maximum number of points to keep on the plots from an incoming stream.
        /// 
        /// If `maxpoints` is set to *50*, only the newest 50 points will be displayed on the plot.
        public var maxPoints: Double? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case token
            case maxPoints = "maxpoints"
        }
        
        /// Creates `Stream` object with specified properties.
        /// 
        /// - Parameters:
        ///   - token: The stream id number links a data trace on a plot with a stream.
        ///   - maxPoints: Sets the maximum number of points to keep on the plots from an incoming stream.
        public init(token: String? = nil, maxPoints: Double? = nil) {
            self.token = token
            self.maxPoints = maxPoints
        }
        
    }

    /// An array of operations that manipulate the trace data, for example filtering or sorting the data
    /// arrays.
    /// 
    /// - Note:
    ///   Used by `Scatter.transforms`, `Bar.transforms`, `Box.transforms`, `Heatmap.transforms`,
    ///   `Histogram.transforms`, `Histogram2D.transforms`, `Histogram2DContour.transforms`,
    ///   `Contour.transforms`, `ScatterTernary.transforms`, `Violin.transforms`, `Funnel.transforms`,
    ///   `Waterfall.transforms`, `Pie.transforms`, `Sunburst.transforms`, `Treemap.transforms`,
    ///   `FunnelArea.transforms`, `Scatter3D.transforms`, `ScatterGeo.transforms`,
    ///   `Choropleth.transforms`, `ScatterGL.transforms`, `ScatterPlotMatrix.transforms`,
    ///   `HeatmapGL.transforms`, `ParallelCoordinates.transforms`, `ParallelCategories.transforms`,
    ///   `ScatterMapbox.transforms`, `ChoroplethMapbox.transforms`, `DensityMapbox.transforms`,
    ///   `Indicator.transforms`, `ScatterCarpet.transforms`, `OHLC.transforms`, `Candlestick.transforms`,
    ///   `ScatterPolar.transforms`, `ScatterPolarGL.transforms`, `BarPolar.transforms`.
    public struct Transform: Encodable {
        /// Creates `Transform` object with specified properties.
        public init() {
        }
        
    }

    /// - Note:
    ///   Used by `Scatter.marker`, `ScatterTernary.marker`, `ScatterCarpet.marker`,
    ///   `ScatterPolar.marker`.
    public struct GradientMarker: Encodable {
        /// Sets the marker symbol type.
        /// 
        /// Adding 100 is equivalent to appending *-open* to a symbol name. Adding 200 is equivalent to
        /// appending *-dot* to a symbol name. Adding 300 is equivalent to appending *-open-dot* or
        /// *dot-open* to a symbol name.
        public var symbol: Shared.Symbol? = nil
    
        /// Sets the marker opacity.
        public var opacity: Data<Double>? = nil
    
        /// Sets the marker size (in px).
        public var size: Data<Double>? = nil
    
        /// Sets a maximum number of points to be drawn on the graph.
        /// 
        /// *0* corresponds to no limit.
        public var maxDisplayed: Double? = nil
    
        /// Has an effect only if `marker.size` is set to a numerical array.
        /// 
        /// Sets the scale factor used to determine the rendered size of marker points. Use with `sizemin`
        /// and `sizemode`.
        public var sizeReference: Double? = nil
    
        /// Has an effect only if `marker.size` is set to a numerical array.
        /// 
        /// Sets the minimum size (in px) of the rendered marker points.
        public var sizeMin: Double? = nil
    
        /// Has an effect only if `marker.size` is set to a numerical array.
        /// 
        /// Sets the rule for which the data in `size` is converted to pixels.
        public var sizeMode: Shared.SizeMode? = nil
    
        public var line: Shared.MarkerLine? = nil
    
        public var gradient: Shared.Gradient? = nil
    
        /// Sets themarkercolor.
        /// 
        /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
        /// relative to the max and min values of the array or relative to `marker.cmin` and `marker.cmax`
        /// if set.
        public var coloring: Coloring? = nil
    
        /// Determines whether or not the color domain is computed with respect to the input data (here in
        /// `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax` Has an effect only if in
        /// `marker.color`is set to a numerical array.
        /// 
        /// Defaults to `false` when `marker.cmin` and `marker.cmax` are set by the user.
        public var cAuto: Bool? = nil
    
        /// Sets the lower bound of the color domain.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmax` must be set as well.
        public var cMin: Double? = nil
    
        /// Sets the upper bound of the color domain.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmin` must be set as well.
        public var cMax: Double? = nil
    
        /// Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax` to be
        /// equidistant to this point.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color`. Has no effect when `marker.cauto` is `false`.
        public var cMiddle: Double? = nil
    
        /// Sets the colorscale.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. The colorscale must be an
        /// array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named
        /// color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For
        /// example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale
        /// in color space, use`marker.cmin` and `marker.cmax`. Alternatively, `colorscale` may be a palette
        /// name string of the following list:
        /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
        public var colorScale: ColorScale? = nil
    
        /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette
        /// determined by `marker.colorscale`.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. In case `colorscale` is
        /// unspecified or `autocolorscale` is true, the default palette will be chosen according to whether
        /// numbers in the `color` array are all positive, all negative or mixed.
        public var autoColorScale: Bool? = nil
    
        /// Reverses the color mapping if true.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. If true, `marker.cmin` will
        /// correspond to the last color in the array and `marker.cmax` will correspond to the first color.
        public var reverseScale: Bool? = nil
    
        /// Determines whether or not a colorbar is displayed for this trace.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array.
        public var showScale: Bool? = nil
    
        public var colorBar: Shared.ColorBar? = nil
    
        /// Sets a reference to a shared color axis.
        /// 
        /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
        /// for these shared color axes are set in the layout, under `layout.coloraxis`,
        /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
        public var colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1)
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case symbol
            case opacity
            case size
            case maxDisplayed = "maxdisplayed"
            case sizeReference = "sizeref"
            case sizeMin = "sizemin"
            case sizeMode = "sizemode"
            case line
            case gradient
            case coloring = "color"
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
        }
        
        /// Creates `GradientMarker` object with specified properties.
        /// 
        /// - Parameters:
        ///   - symbol: Sets the marker symbol type.
        ///   - opacity: Sets the marker opacity.
        ///   - size: Sets the marker size (in px).
        ///   - maxDisplayed: Sets a maximum number of points to be drawn on the graph.
        ///   - sizeReference: Has an effect only if `marker.size` is set to a numerical array.
        ///   - sizeMin: Has an effect only if `marker.size` is set to a numerical array.
        ///   - sizeMode: Has an effect only if `marker.size` is set to a numerical array.
        ///   - line:
        ///   - gradient:
        ///   - coloring: Sets themarkercolor.
        ///   - cAuto: Determines whether or not the color domain is computed with respect to the input data
        ///   (here in `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax` Has an effect only
        ///   if in `marker.color`is set to a numerical array.
        ///   - cMin: Sets the lower bound of the color domain.
        ///   - cMax: Sets the upper bound of the color domain.
        ///   - cMiddle: Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax`
        ///   to be equidistant to this point.
        ///   - colorScale: Sets the colorscale.
        ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
        ///   true`) or the palette determined by `marker.colorscale`.
        ///   - reverseScale: Reverses the color mapping if true.
        ///   - showScale: Determines whether or not a colorbar is displayed for this trace.
        ///   - colorBar:
        ///   - colorAxis: Sets a reference to a shared color axis.
        public init(symbol: Shared.Symbol? = nil, opacity: Data<Double>? = nil, size: Data<Double>? =
                nil, maxDisplayed: Double? = nil, sizeReference: Double? = nil, sizeMin: Double? = nil,
                sizeMode: Shared.SizeMode? = nil, line: Shared.MarkerLine? = nil, gradient: Shared.Gradient? =
                nil, coloring: Coloring? = nil, cAuto: Bool? = nil, cMin: Double? = nil, cMax: Double? = nil,
                cMiddle: Double? = nil, colorScale: ColorScale? = nil, autoColorScale: Bool? = nil,
                reverseScale: Bool? = nil, showScale: Bool? = nil, colorBar: Shared.ColorBar? = nil, colorAxis:
                Layout.ColorAxis = Layout.ColorAxis(uid: 1)) {
            self.symbol = symbol
            self.opacity = opacity
            self.size = size
            self.maxDisplayed = maxDisplayed
            self.sizeReference = sizeReference
            self.sizeMin = sizeMin
            self.sizeMode = sizeMode
            self.line = line
            self.gradient = gradient
            self.coloring = coloring
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
        }
        
    }

    /// - Note:
    ///   Used by `Shared.GradientMarker.line`, `Shared.Marker.line`, `Histogram.Marker.line`,
    ///   `ScatterTernary.GradientMarker.line`, `Funnel.Marker.line`, `Shared.SymbolicMarker.line`,
    ///   `ScatterGeo.GradientMarker.line`, `ScatterGL.SymbolicMarker.line`,
    ///   `ScatterPlotMatrix.SymbolicMarker.line`, `ScatterCarpet.GradientMarker.line`,
    ///   `ScatterPolar.GradientMarker.line`, `ScatterPolarGL.SymbolicMarker.line`,
    ///   `BarPolar.Marker.line`.
    public struct MarkerLine: Encodable {
        /// Sets the width (in px) of the lines bounding the marker points.
        public var width: Data<Double>? = nil
    
        /// Sets themarker.linecolor.
        /// 
        /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
        /// relative to the max and min values of the array or relative to `marker.line.cmin` and
        /// `marker.line.cmax` if set.
        public var coloring: Coloring? = nil
    
        /// Determines whether or not the color domain is computed with respect to the input data (here in
        /// `marker.line.color`) or the bounds set in `marker.line.cmin` and `marker.line.cmax` Has an
        /// effect only if in `marker.line.color`is set to a numerical array.
        /// 
        /// Defaults to `false` when `marker.line.cmin` and `marker.line.cmax` are set by the user.
        public var cAuto: Bool? = nil
    
        /// Sets the lower bound of the color domain.
        /// 
        /// Has an effect only if in `marker.line.color`is set to a numerical array. Value should have the
        /// same units as in `marker.line.color` and if set, `marker.line.cmax` must be set as well.
        public var cMin: Double? = nil
    
        /// Sets the upper bound of the color domain.
        /// 
        /// Has an effect only if in `marker.line.color`is set to a numerical array. Value should have the
        /// same units as in `marker.line.color` and if set, `marker.line.cmin` must be set as well.
        public var cMax: Double? = nil
    
        /// Sets the mid-point of the color domain by scaling `marker.line.cmin` and/or `marker.line.cmax`
        /// to be equidistant to this point.
        /// 
        /// Has an effect only if in `marker.line.color`is set to a numerical array. Value should have the
        /// same units as in `marker.line.color`. Has no effect when `marker.line.cauto` is `false`.
        public var cMiddle: Double? = nil
    
        /// Sets the colorscale.
        /// 
        /// Has an effect only if in `marker.line.color`is set to a numerical array. The colorscale must be
        /// an array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named
        /// color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For
        /// example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale
        /// in color space, use`marker.line.cmin` and `marker.line.cmax`. Alternatively, `colorscale` may be
        /// a palette name string of the following list:
        /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
        public var colorScale: ColorScale? = nil
    
        /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette
        /// determined by `marker.line.colorscale`.
        /// 
        /// Has an effect only if in `marker.line.color`is set to a numerical array. In case `colorscale` is
        /// unspecified or `autocolorscale` is true, the default palette will be chosen according to whether
        /// numbers in the `color` array are all positive, all negative or mixed.
        public var autoColorScale: Bool? = nil
    
        /// Reverses the color mapping if true.
        /// 
        /// Has an effect only if in `marker.line.color`is set to a numerical array. If true,
        /// `marker.line.cmin` will correspond to the last color in the array and `marker.line.cmax` will
        /// correspond to the first color.
        public var reverseScale: Bool? = nil
    
        /// Sets a reference to a shared color axis.
        /// 
        /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
        /// for these shared color axes are set in the layout, under `layout.coloraxis`,
        /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
        public var colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1)
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case width
            case coloring = "color"
            case cAuto = "cauto"
            case cMin = "cmin"
            case cMax = "cmax"
            case cMiddle = "cmid"
            case colorScale = "colorscale"
            case autoColorScale = "autocolorscale"
            case reverseScale = "reversescale"
            case colorAxis = "coloraxis"
        }
        
        /// Creates `MarkerLine` object with specified properties.
        /// 
        /// - Parameters:
        ///   - width: Sets the width (in px) of the lines bounding the marker points.
        ///   - coloring: Sets themarker.linecolor.
        ///   - cAuto: Determines whether or not the color domain is computed with respect to the input data
        ///   (here in `marker.line.color`) or the bounds set in `marker.line.cmin` and `marker.line.cmax` Has
        ///   an effect only if in `marker.line.color`is set to a numerical array.
        ///   - cMin: Sets the lower bound of the color domain.
        ///   - cMax: Sets the upper bound of the color domain.
        ///   - cMiddle: Sets the mid-point of the color domain by scaling `marker.line.cmin` and/or
        ///   `marker.line.cmax` to be equidistant to this point.
        ///   - colorScale: Sets the colorscale.
        ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
        ///   true`) or the palette determined by `marker.line.colorscale`.
        ///   - reverseScale: Reverses the color mapping if true.
        ///   - colorAxis: Sets a reference to a shared color axis.
        public init(width: Data<Double>? = nil, coloring: Coloring? = nil, cAuto: Bool? = nil, cMin:
                Double? = nil, cMax: Double? = nil, cMiddle: Double? = nil, colorScale: ColorScale? = nil,
                autoColorScale: Bool? = nil, reverseScale: Bool? = nil, colorAxis: Layout.ColorAxis =
                Layout.ColorAxis(uid: 1)) {
            self.width = width
            self.coloring = coloring
            self.cAuto = cAuto
            self.cMin = cMin
            self.cMax = cMax
            self.cMiddle = cMiddle
            self.colorScale = colorScale
            self.autoColorScale = autoColorScale
            self.reverseScale = reverseScale
            self.colorAxis = colorAxis
        }
        
    }

    /// - Note:
    ///   Used by `Shared.GradientMarker.gradient`, `ScatterTernary.GradientMarker.gradient`,
    ///   `ScatterGeo.GradientMarker.gradient`, `ScatterCarpet.GradientMarker.gradient`,
    ///   `ScatterPolar.GradientMarker.gradient`.
    public struct Gradient: Encodable {
        /// Sets the type of gradient used to fill the markers
        public enum `Type`: String, Encodable {
            case radial
            case horizontal
            case vertical
            case none
        }
        /// Sets the type of gradient used to fill the markers
        public var type: `Type`? = nil
    
        /// Sets the final color of the gradient fill: the center color for radial, the right for
        /// horizontal, or the bottom for vertical.
        public var coloring: Coloring? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case type
            case coloring = "color"
        }
        
        /// Creates `Gradient` object with specified properties.
        /// 
        /// - Parameters:
        ///   - type: Sets the type of gradient used to fill the markers
        ///   - coloring: Sets the final color of the gradient fill: the center color for radial, the right
        ///   for horizontal, or the bottom for vertical.
        public init(type: `Type`? = nil, coloring: Coloring? = nil) {
            self.type = type
            self.coloring = coloring
        }
        
    }

    /// - Note:
    ///   Used by `Scatter.xError`, `Scatter.yError`, `Bar.xError`, `Bar.yError`, `Histogram.xError`,
    ///   `Histogram.yError`, `Scatter3D.xError`, `Scatter3D.yError`, `Scatter3D.zError`,
    ///   `ScatterGL.xError`, `ScatterGL.yError`.
    public struct Error: Encodable {
        /// Determines whether or not this set of error bars is visible.
        public var visible: Bool? = nil
    
        /// Determines the rule used to generate the error bars.
        /// 
        /// If *constant`, the bar lengths are of a constant value. Set this constant in `value`. If
        /// *percent*, the bar lengths correspond to a percentage of underlying data. Set this percentage in
        /// `value`. If *sqrt*, the bar lengths correspond to the sqaure of the underlying data. If *data*,
        /// the bar lengths are set with data set `array`.
        public enum `Type`: String, Encodable {
            case percent
            case constant
            case sqrt
            case data
        }
        /// Determines the rule used to generate the error bars.
        /// 
        /// If *constant`, the bar lengths are of a constant value. Set this constant in `value`. If
        /// *percent*, the bar lengths correspond to a percentage of underlying data. Set this percentage in
        /// `value`. If *sqrt*, the bar lengths correspond to the sqaure of the underlying data. If *data*,
        /// the bar lengths are set with data set `array`.
        public var type: `Type`? = nil
    
        /// Determines whether or not the error bars have the same length in both direction (top/bottom for
        /// vertical bars, left/right for horizontal bars.
        public var symmetric: Bool? = nil
    
        /// Sets the data corresponding the length of each error bar.
        /// 
        /// Values are plotted relative to the underlying data.
        public var array: [Double]? = nil
    
        /// Sets the data corresponding the length of each error bar in the bottom (left) direction for
        /// vertical (horizontal) bars Values are plotted relative to the underlying data.
        public var arrayMinus: [Double]? = nil
    
        /// Sets the value of either the percentage (if `type` is set to *percent*) or the constant (if
        /// `type` is set to *constant*) corresponding to the lengths of the error bars.
        public var value: Double? = nil
    
        /// Sets the value of either the percentage (if `type` is set to *percent*) or the constant (if
        /// `type` is set to *constant*) corresponding to the lengths of the error bars in the bottom (left)
        /// direction for vertical (horizontal) bars
        public var valueMinus: Double? = nil
    
        public var traceReference: Int? = nil
    
        public var traceReferenceMinus: Int? = nil
    
        /// Sets the stoke color of the error bars.
        public var color: Color? = nil
    
        /// Sets the thickness (in px) of the error bars.
        public var thickness: Double? = nil
    
        /// Sets the width (in px) of the cross-bar at both ends of the error bars.
        public var width: Double? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case visible
            case type
            case symmetric
            case array
            case arrayMinus = "arrayminus"
            case value
            case valueMinus = "valueminus"
            case traceReference = "traceref"
            case traceReferenceMinus = "tracerefminus"
            case color
            case thickness
            case width
        }
        
        /// Creates `Error` object with specified properties.
        /// 
        /// - Parameters:
        ///   - visible: Determines whether or not this set of error bars is visible.
        ///   - type: Determines the rule used to generate the error bars.
        ///   - symmetric: Determines whether or not the error bars have the same length in both direction
        ///   (top/bottom for vertical bars, left/right for horizontal bars.
        ///   - array: Sets the data corresponding the length of each error bar.
        ///   - arrayMinus: Sets the data corresponding the length of each error bar in the bottom (left)
        ///   direction for vertical (horizontal) bars Values are plotted relative to the underlying data.
        ///   - value: Sets the value of either the percentage (if `type` is set to *percent*) or the constant
        ///   (if `type` is set to *constant*) corresponding to the lengths of the error bars.
        ///   - valueMinus: Sets the value of either the percentage (if `type` is set to *percent*) or the
        ///   constant (if `type` is set to *constant*) corresponding to the lengths of the error bars in the
        ///   bottom (left) direction for vertical (horizontal) bars
        ///   - traceReference:
        ///   - traceReferenceMinus:
        ///   - color: Sets the stoke color of the error bars.
        ///   - thickness: Sets the thickness (in px) of the error bars.
        ///   - width: Sets the width (in px) of the cross-bar at both ends of the error bars.
        public init(visible: Bool? = nil, type: `Type`? = nil, symmetric: Bool? = nil, array: [Double]?
                = nil, arrayMinus: [Double]? = nil, value: Double? = nil, valueMinus: Double? = nil,
                traceReference: Int? = nil, traceReferenceMinus: Int? = nil, color: Color? = nil, thickness:
                Double? = nil, width: Double? = nil) {
            self.visible = visible
            self.type = type
            self.symmetric = symmetric
            self.array = array
            self.arrayMinus = arrayMinus
            self.value = value
            self.valueMinus = valueMinus
            self.traceReference = traceReference
            self.traceReferenceMinus = traceReferenceMinus
            self.color = color
            self.thickness = thickness
            self.width = width
        }
        
    }

    /// Sets the font used for `text` lying outside the bar.
    /// 
    /// - Note:
    ///   Used by `Bar.outsideTextFont`, `Funnel.outsideTextFont`, `Waterfall.outsideTextFont`,
    ///   `Pie.outsideTextFont`, `Sunburst.outsideTextFont`, `Treemap.outsideTextFont`.
    public struct OutsideTextFont: Encodable {
        /// HTML font family - the typeface that will be applied by the web browser.
        /// 
        /// The web browser will only be able to apply a font if it is available on the system which it
        /// operates. Provide multiple font families, separated by commas, to indicate the preference in
        /// which to apply fonts if they aren't available on the system. The plotly service (at
        /// https://plot.ly or on-premise) generates images on a server, where only a select number of fonts
        /// are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,,
        /// *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*,
        /// *PT Sans Narrow*, *Raleway*, *Times New Roman*.
        public var family: Data<String>? = nil
    
        public var size: Data<Double>? = nil
    
        public var coloring: Coloring? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case family
            case size
            case coloring = "color"
        }
        
        /// Creates `OutsideTextFont` object with specified properties.
        /// 
        /// - Parameters:
        ///   - family: HTML font family - the typeface that will be applied by the web browser.
        ///   - size:
        ///   - coloring:
        public init(family: Data<String>? = nil, size: Data<Double>? = nil, coloring: Coloring? = nil) {
            self.family = family
            self.size = size
            self.coloring = coloring
        }
        
    }

    /// - Note:
    ///   Used by `Bar.marker`, `Histogram.marker`, `Funnel.marker`, `BarPolar.marker`.
    public struct Marker: Encodable {
        public var line: Shared.MarkerLine? = nil
    
        /// Sets themarkercolor.
        /// 
        /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
        /// relative to the max and min values of the array or relative to `marker.cmin` and `marker.cmax`
        /// if set.
        public var coloring: Coloring? = nil
    
        /// Determines whether or not the color domain is computed with respect to the input data (here in
        /// `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax` Has an effect only if in
        /// `marker.color`is set to a numerical array.
        /// 
        /// Defaults to `false` when `marker.cmin` and `marker.cmax` are set by the user.
        public var cAuto: Bool? = nil
    
        /// Sets the lower bound of the color domain.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmax` must be set as well.
        public var cMin: Double? = nil
    
        /// Sets the upper bound of the color domain.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmin` must be set as well.
        public var cMax: Double? = nil
    
        /// Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax` to be
        /// equidistant to this point.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color`. Has no effect when `marker.cauto` is `false`.
        public var cMiddle: Double? = nil
    
        /// Sets the colorscale.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. The colorscale must be an
        /// array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named
        /// color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For
        /// example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale
        /// in color space, use`marker.cmin` and `marker.cmax`. Alternatively, `colorscale` may be a palette
        /// name string of the following list:
        /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
        public var colorScale: ColorScale? = nil
    
        /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette
        /// determined by `marker.colorscale`.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. In case `colorscale` is
        /// unspecified or `autocolorscale` is true, the default palette will be chosen according to whether
        /// numbers in the `color` array are all positive, all negative or mixed.
        public var autoColorScale: Bool? = nil
    
        /// Reverses the color mapping if true.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. If true, `marker.cmin` will
        /// correspond to the last color in the array and `marker.cmax` will correspond to the first color.
        public var reverseScale: Bool? = nil
    
        /// Determines whether or not a colorbar is displayed for this trace.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array.
        public var showScale: Bool? = nil
    
        public var colorBar: Shared.ColorBar? = nil
    
        /// Sets a reference to a shared color axis.
        /// 
        /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
        /// for these shared color axes are set in the layout, under `layout.coloraxis`,
        /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
        public var colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1)
    
        /// Sets the opacity of the bars.
        public var opacity: Data<Double>? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case line
            case coloring = "color"
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
        }
        
        /// Creates `Marker` object with specified properties.
        /// 
        /// - Parameters:
        ///   - line:
        ///   - coloring: Sets themarkercolor.
        ///   - cAuto: Determines whether or not the color domain is computed with respect to the input data
        ///   (here in `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax` Has an effect only
        ///   if in `marker.color`is set to a numerical array.
        ///   - cMin: Sets the lower bound of the color domain.
        ///   - cMax: Sets the upper bound of the color domain.
        ///   - cMiddle: Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax`
        ///   to be equidistant to this point.
        ///   - colorScale: Sets the colorscale.
        ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
        ///   true`) or the palette determined by `marker.colorscale`.
        ///   - reverseScale: Reverses the color mapping if true.
        ///   - showScale: Determines whether or not a colorbar is displayed for this trace.
        ///   - colorBar:
        ///   - colorAxis: Sets a reference to a shared color axis.
        ///   - opacity: Sets the opacity of the bars.
        public init(line: Shared.MarkerLine? = nil, coloring: Coloring? = nil, cAuto: Bool? = nil, cMin:
                Double? = nil, cMax: Double? = nil, cMiddle: Double? = nil, colorScale: ColorScale? = nil,
                autoColorScale: Bool? = nil, reverseScale: Bool? = nil, showScale: Bool? = nil, colorBar:
                Shared.ColorBar? = nil, colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1), opacity:
                Data<Double>? = nil) {
            self.line = line
            self.coloring = coloring
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
        }
        
    }

    /// - Note:
    ///   Used by `Box.line`, `Violin.line`, `Violin.Box.line`, `Waterfall.Increasing.Marker.line`,
    ///   `Waterfall.Decreasing.Marker.line`, `Waterfall.Totals.Marker.line`, `ScatterMapbox.line`,
    ///   `Indicator.Gauge.Bar.line`, `Indicator.Gauge.Step.line`, `Indicator.Gauge.Threshold.line`.
    public struct Line: Encodable {
        /// Sets the color of line bounding the box(es).
        public var color: Color? = nil
    
        /// Sets the width (in px) of line bounding the box(es).
        public var width: Double? = nil
    
        /// Creates `Line` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets the color of line bounding the box(es).
        ///   - width: Sets the width (in px) of line bounding the box(es).
        public init(color: Color? = nil, width: Double? = nil) {
            self.color = color
            self.width = width
        }
        
    }

    /// - Note:
    ///   Used by `Histogram.xBins`, `Histogram.yBins`, `Histogram2D.xBins`, `Histogram2D.yBins`,
    ///   `Histogram2DContour.xBins`, `Histogram2DContour.yBins`.
    public struct Bins: Encodable {
        /// Sets the starting value for the x axis bins.
        /// 
        /// Defaults to the minimum data value, shifted down if necessary to make nice round values and to
        /// remove ambiguous bin edges. For example, if most of the data is integers we shift the bin edges
        /// 0.5 down, so a `size` of 5 would have a default `start` of -0.5, so it is clear that 0-4 are in
        /// the first bin, 5-9 in the second, but continuous data gets a start of 0 and bins [0,5), [5,10)
        /// etc. Dates behave similarly, and `start` should be a date string. For category data, `start` is
        /// based on the category serial numbers, and defaults to -0.5. If multiple non-overlaying
        /// histograms share a subplot, the first explicit `start` is used exactly and all others are
        /// shifted down (if necessary) to differ from that one by an integer number of bins.
        public var start: Anything? = nil
    
        /// Sets the end value for the x axis bins.
        /// 
        /// The last bin may not end exactly at this value, we increment the bin edge by `size` from `start`
        /// until we reach or exceed `end`. Defaults to the maximum data value. Like `start`, for dates use
        /// a date string, and for category data `end` is based on the category serial numbers.
        public var end: Anything? = nil
    
        /// Sets the size of each x axis bin.
        /// 
        /// Default behavior: If `nbinsx` is 0 or omitted, we choose a nice round bin size such that the
        /// number of bins is about the same as the typical number of samples in each bin. If `nbinsx` is
        /// provided, we choose a nice round bin size giving no more than that many bins. For date data, use
        /// milliseconds or *M<n>* for months, as in `axis.dtick`. For category data, the number of
        /// categories to bin together (always defaults to 1). If multiple non-overlaying histograms share a
        /// subplot, the first explicit `size` is used and all others discarded. If no `size` is
        /// provided,the sample data from all traces is combined to determine `size` as described above.
        public var size: Anything? = nil
    
        /// Creates `Bins` object with specified properties.
        /// 
        /// - Parameters:
        ///   - start: Sets the starting value for the x axis bins.
        ///   - end: Sets the end value for the x axis bins.
        ///   - size: Sets the size of each x axis bin.
        public init(start: Anything? = nil, end: Anything? = nil, size: Anything? = nil) {
            self.start = start
            self.end = end
            self.size = size
        }
        
    }

    /// - Note:
    ///   Used by `Histogram2DContour.contours`, `Contour.contours`, `ContourCarpet.contours`.
    public struct Contours: Encodable {
        /// If `levels`, the data is represented as a contour plot with multiple levels displayed.
        /// 
        /// If `constraint`, the data is represented as constraints with the invalid region shaded as
        /// specified by the `operation` and `value` parameters.
        public enum `Type`: String, Encodable {
            case levels
            case constraint
        }
        /// If `levels`, the data is represented as a contour plot with multiple levels displayed.
        /// 
        /// If `constraint`, the data is represented as constraints with the invalid region shaded as
        /// specified by the `operation` and `value` parameters.
        public var type: `Type`? = nil
    
        /// Sets the starting contour level value.
        /// 
        /// Must be less than `contours.end`
        public var start: Double? = nil
    
        /// Sets the end contour level value.
        /// 
        /// Must be more than `contours.start`
        public var end: Double? = nil
    
        /// Sets the step between each contour level.
        /// 
        /// Must be positive.
        public var size: Double? = nil
    
        /// Determines the coloring method showing the contour values.
        /// 
        /// If *fill*, coloring is done evenly between each contour level If *heatmap*, a heatmap gradient
        /// coloring is applied between each contour level. If *lines*, coloring is done on the contour
        /// lines. If *none*, no coloring is applied on this trace.
        public enum Coloring: String, Encodable {
            case fill
            case heatmap
            case lines
            case none
        }
        /// Determines the coloring method showing the contour values.
        /// 
        /// If *fill*, coloring is done evenly between each contour level If *heatmap*, a heatmap gradient
        /// coloring is applied between each contour level. If *lines*, coloring is done on the contour
        /// lines. If *none*, no coloring is applied on this trace.
        public var coloring: Coloring? = nil
    
        /// Determines whether or not the contour lines are drawn.
        /// 
        /// Has an effect only if `contours.coloring` is set to *fill*.
        public var showLines: Bool? = nil
    
        /// Determines whether to label the contour lines with their values.
        public var showLabels: Bool? = nil
    
        /// Sets the font used for labeling the contour levels.
        /// 
        /// The default color comes from the lines, if shown. The default family and size come from
        /// `layout.font`.
        public var labelFont: Shared.Font? = nil
    
        /// Sets the contour label formatting rule using d3 formatting mini-language which is very similar
        /// to Python, see: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
        public var labelFormat: String? = nil
    
        /// Sets the constraint operation.
        /// 
        /// *=* keeps regions equal to `value` *<* and *<=* keep regions less than `value` *>* and *>=* keep
        /// regions greater than `value` *[]*, *()*, *[)*, and *(]* keep regions inside `value[0]` to
        /// `value[1]` *][*, *)(*, *](*, *)[* keep regions outside `value[0]` to value[1]` Open vs. closed
        /// intervals make no difference to constraint display, but all versions are allowed for consistency
        /// with filter transforms.
        public var operation: Shared.Operation? = nil
    
        /// Sets the value or values of the constraint boundary.
        /// 
        /// When `operation` is set to one of the comparison values (=,<,>=,>,<=) *value* is expected to be
        /// a number. When `operation` is set to one of the interval values ([],(),[),(],][,)(,](,)[)
        /// *value* is expected to be an array of two numbers where the first is the lower bound and the
        /// second is the upper bound.
        public var value: Anything? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case type
            case start
            case end
            case size
            case coloring
            case showLines = "showlines"
            case showLabels = "showlabels"
            case labelFont = "labelfont"
            case labelFormat = "labelformat"
            case operation
            case value
        }
        
        /// Creates `Contours` object with specified properties.
        /// 
        /// - Parameters:
        ///   - type: If `levels`, the data is represented as a contour plot with multiple levels displayed.
        ///   - start: Sets the starting contour level value.
        ///   - end: Sets the end contour level value.
        ///   - size: Sets the step between each contour level.
        ///   - coloring: Determines the coloring method showing the contour values.
        ///   - showLines: Determines whether or not the contour lines are drawn.
        ///   - showLabels: Determines whether to label the contour lines with their values.
        ///   - labelFont: Sets the font used for labeling the contour levels.
        ///   - labelFormat: Sets the contour label formatting rule using d3 formatting mini-language which is
        ///   very similar to Python, see:
        ///   https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
        ///   - operation: Sets the constraint operation.
        ///   - value: Sets the value or values of the constraint boundary.
        public init(type: `Type`? = nil, start: Double? = nil, end: Double? = nil, size: Double? = nil,
                coloring: Coloring? = nil, showLines: Bool? = nil, showLabels: Bool? = nil, labelFont:
                Shared.Font? = nil, labelFormat: String? = nil, operation: Shared.Operation? = nil, value:
                Anything? = nil) {
            self.type = type
            self.start = start
            self.end = end
            self.size = size
            self.coloring = coloring
            self.showLines = showLines
            self.showLabels = showLabels
            self.labelFont = labelFont
            self.labelFormat = labelFormat
            self.operation = operation
            self.value = value
        }
        
    }

    /// - Note:
    ///   Used by `Histogram2DContour.line`, `Contour.line`, `ContourCarpet.line`.
    public struct SmoothDashedLine: Encodable {
        /// Sets the color of the contour level.
        /// 
        /// Has no effect if `contours.coloring` is set to *lines*.
        public var color: Color? = nil
    
        /// Sets the contour line width in (in px)
        public var width: Double? = nil
    
        /// Sets the dash style of lines.
        /// 
        /// Set to a dash type string (*solid*, *dot*, *dash*, *longdash*, *dashdot*, or *longdashdot*) or a
        /// dash length list in px (eg *5px,10px,2px,2px*).
        public var dash: String? = nil
    
        /// Sets the amount of smoothing for the contour lines, where *0* corresponds to no smoothing.
        public var smoothing: Double? = nil
    
        /// Creates `SmoothDashedLine` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets the color of the contour level.
        ///   - width: Sets the contour line width in (in px)
        ///   - dash: Sets the dash style of lines.
        ///   - smoothing: Sets the amount of smoothing for the contour lines, where *0* corresponds to no
        ///   smoothing.
        public init(color: Color? = nil, width: Double? = nil, dash: String? = nil, smoothing: Double? =
                nil) {
            self.color = color
            self.width = width
            self.dash = dash
            self.smoothing = smoothing
        }
        
    }

    /// - Note:
    ///   Used by `ScatterTernary.line`, `ScatterCarpet.line`, `ScatterPolar.line`.
    public struct ShapedSmoothDashedLine: Encodable {
        /// Sets the line color.
        public var color: Color? = nil
    
        /// Sets the line width (in px).
        public var width: Double? = nil
    
        /// Sets the dash style of lines.
        /// 
        /// Set to a dash type string (*solid*, *dot*, *dash*, *longdash*, *dashdot*, or *longdashdot*) or a
        /// dash length list in px (eg *5px,10px,2px,2px*).
        public var dash: String? = nil
    
        /// Determines the line shape.
        /// 
        /// With *spline* the lines are drawn using spline interpolation. The other available values
        /// correspond to step-wise line shapes.
        public var shape: Shared.Shape? = nil
    
        /// Has an effect only if `shape` is set to *spline* Sets the amount of smoothing.
        /// 
        /// *0* corresponds to no smoothing (equivalent to a *linear* shape).
        public var smoothing: Double? = nil
    
        /// Creates `ShapedSmoothDashedLine` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets the line color.
        ///   - width: Sets the line width (in px).
        ///   - dash: Sets the dash style of lines.
        ///   - shape: Determines the line shape.
        ///   - smoothing: Has an effect only if `shape` is set to *spline* Sets the amount of smoothing.
        public init(color: Color? = nil, width: Double? = nil, dash: String? = nil, shape: Shared.Shape?
                = nil, smoothing: Double? = nil) {
            self.color = color
            self.width = width
            self.dash = dash
            self.shape = shape
            self.smoothing = smoothing
        }
        
    }

    /// - Note:
    ///   Used by `Pie.Marker.line`, `Sunburst.Marker.line`, `Treemap.Marker.line`,
    ///   `FunnelArea.Marker.line`, `Choropleth.Marker.line`, `ChoroplethMapbox.Marker.line`,
    ///   `Sankey.Node.line`, `Sankey.Link.line`, `Table.Header.line`, `Table.Cells.line`.
    public struct VariableLine: Encodable {
        /// Sets the color of the line enclosing each sector.
        public var coloring: Coloring? = nil
    
        /// Sets the width (in px) of the line enclosing each sector.
        public var width: Data<Double>? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case coloring = "color"
            case width
        }
        
        /// Creates `VariableLine` object with specified properties.
        /// 
        /// - Parameters:
        ///   - coloring: Sets the color of the line enclosing each sector.
        ///   - width: Sets the width (in px) of the line enclosing each sector.
        public init(coloring: Coloring? = nil, width: Data<Double>? = nil) {
            self.coloring = coloring
            self.width = width
        }
        
    }

    /// - Note:
    ///   Used by `Scatter3D.projection`, `Surface.Contours.X.project`, `Surface.Contours.Y.project`,
    ///   `Surface.Contours.Z.project`.
    public struct Projection: Encodable {
        public struct X: Encodable {
            /// Sets whether or not projections are shown along the x axis.
            public var show: Bool? = nil
        
            /// Sets the projection color.
            public var opacity: Double? = nil
        
            /// Sets the scale factor determining the size of the projection marker points.
            public var scale: Double? = nil
        
            /// Creates `X` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Sets whether or not projections are shown along the x axis.
            ///   - opacity: Sets the projection color.
            ///   - scale: Sets the scale factor determining the size of the projection marker points.
            public init(show: Bool? = nil, opacity: Double? = nil, scale: Double? = nil) {
                self.show = show
                self.opacity = opacity
                self.scale = scale
            }
            
        }
        public var x: X? = nil
    
        public struct Y: Encodable {
            /// Sets whether or not projections are shown along the y axis.
            public var show: Bool? = nil
        
            /// Sets the projection color.
            public var opacity: Double? = nil
        
            /// Sets the scale factor determining the size of the projection marker points.
            public var scale: Double? = nil
        
            /// Creates `Y` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Sets whether or not projections are shown along the y axis.
            ///   - opacity: Sets the projection color.
            ///   - scale: Sets the scale factor determining the size of the projection marker points.
            public init(show: Bool? = nil, opacity: Double? = nil, scale: Double? = nil) {
                self.show = show
                self.opacity = opacity
                self.scale = scale
            }
            
        }
        public var y: Y? = nil
    
        public struct Z: Encodable {
            /// Sets whether or not projections are shown along the z axis.
            public var show: Bool? = nil
        
            /// Sets the projection color.
            public var opacity: Double? = nil
        
            /// Sets the scale factor determining the size of the projection marker points.
            public var scale: Double? = nil
        
            /// Creates `Z` object with specified properties.
            /// 
            /// - Parameters:
            ///   - show: Sets whether or not projections are shown along the z axis.
            ///   - opacity: Sets the projection color.
            ///   - scale: Sets the scale factor determining the size of the projection marker points.
            public init(show: Bool? = nil, opacity: Double? = nil, scale: Double? = nil) {
                self.show = show
                self.opacity = opacity
                self.scale = scale
            }
            
        }
        public var z: Z? = nil
    
        /// Creates `Projection` object with specified properties.
        public init(x: X? = nil, y: Y? = nil, z: Z? = nil) {
            self.x = x
            self.y = y
            self.z = z
        }
        
    }

    /// - Note:
    ///   Used by `Scatter3D.marker`, `ScatterGL.marker`, `ScatterPlotMatrix.marker`,
    ///   `ScatterPolarGL.marker`.
    public struct SymbolicMarker: Encodable {
        /// Sets the marker symbol type.
        public enum Symbol: String, Encodable {
            case circle
            case circleOpen = "circle-open"
            case square
            case squareOpen = "square-open"
            case diamond
            case diamondOpen = "diamond-open"
            case cross
            case x
        }
        /// Sets the marker symbol type.
        public var symbol: Symbol? = nil
    
        /// Sets the marker size (in px).
        public var size: Data<Double>? = nil
    
        /// Has an effect only if `marker.size` is set to a numerical array.
        /// 
        /// Sets the scale factor used to determine the rendered size of marker points. Use with `sizemin`
        /// and `sizemode`.
        public var sizeReference: Double? = nil
    
        /// Has an effect only if `marker.size` is set to a numerical array.
        /// 
        /// Sets the minimum size (in px) of the rendered marker points.
        public var sizeMin: Double? = nil
    
        /// Has an effect only if `marker.size` is set to a numerical array.
        /// 
        /// Sets the rule for which the data in `size` is converted to pixels.
        public var sizeMode: Shared.SizeMode? = nil
    
        /// Sets the marker opacity.
        /// 
        /// Note that the marker opacity for scatter3d traces must be a scalar value for performance
        /// reasons. To set a blending opacity value (i.e. which is not transparent), set *marker.color* to
        /// an rgba color and use its alpha channel.
        public var opacity: Double? = nil
    
        public var colorBar: Shared.ColorBar? = nil
    
        public var line: Shared.MarkerLine? = nil
    
        /// Sets themarkercolor.
        /// 
        /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
        /// relative to the max and min values of the array or relative to `marker.cmin` and `marker.cmax`
        /// if set.
        public var coloring: Coloring? = nil
    
        /// Determines whether or not the color domain is computed with respect to the input data (here in
        /// `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax` Has an effect only if in
        /// `marker.color`is set to a numerical array.
        /// 
        /// Defaults to `false` when `marker.cmin` and `marker.cmax` are set by the user.
        public var cAuto: Bool? = nil
    
        /// Sets the lower bound of the color domain.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmax` must be set as well.
        public var cMin: Double? = nil
    
        /// Sets the upper bound of the color domain.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color` and if set, `marker.cmin` must be set as well.
        public var cMax: Double? = nil
    
        /// Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax` to be
        /// equidistant to this point.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. Value should have the same
        /// units as in `marker.color`. Has no effect when `marker.cauto` is `false`.
        public var cMiddle: Double? = nil
    
        /// Sets the colorscale.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. The colorscale must be an
        /// array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named
        /// color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For
        /// example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale
        /// in color space, use`marker.cmin` and `marker.cmax`. Alternatively, `colorscale` may be a palette
        /// name string of the following list:
        /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
        public var colorScale: ColorScale? = nil
    
        /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette
        /// determined by `marker.colorscale`.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. In case `colorscale` is
        /// unspecified or `autocolorscale` is true, the default palette will be chosen according to whether
        /// numbers in the `color` array are all positive, all negative or mixed.
        public var autoColorScale: Bool? = nil
    
        /// Reverses the color mapping if true.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array. If true, `marker.cmin` will
        /// correspond to the last color in the array and `marker.cmax` will correspond to the first color.
        public var reverseScale: Bool? = nil
    
        /// Determines whether or not a colorbar is displayed for this trace.
        /// 
        /// Has an effect only if in `marker.color`is set to a numerical array.
        public var showScale: Bool? = nil
    
        /// Sets a reference to a shared color axis.
        /// 
        /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
        /// for these shared color axes are set in the layout, under `layout.coloraxis`,
        /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
        public var colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1)
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case symbol
            case size
            case sizeReference = "sizeref"
            case sizeMin = "sizemin"
            case sizeMode = "sizemode"
            case opacity
            case colorBar = "colorbar"
            case line
            case coloring = "color"
            case cAuto = "cauto"
            case cMin = "cmin"
            case cMax = "cmax"
            case cMiddle = "cmid"
            case colorScale = "colorscale"
            case autoColorScale = "autocolorscale"
            case reverseScale = "reversescale"
            case showScale = "showscale"
            case colorAxis = "coloraxis"
        }
        
        /// Creates `SymbolicMarker` object with specified properties.
        /// 
        /// - Parameters:
        ///   - symbol: Sets the marker symbol type.
        ///   - size: Sets the marker size (in px).
        ///   - sizeReference: Has an effect only if `marker.size` is set to a numerical array.
        ///   - sizeMin: Has an effect only if `marker.size` is set to a numerical array.
        ///   - sizeMode: Has an effect only if `marker.size` is set to a numerical array.
        ///   - opacity: Sets the marker opacity.
        ///   - colorBar:
        ///   - line:
        ///   - coloring: Sets themarkercolor.
        ///   - cAuto: Determines whether or not the color domain is computed with respect to the input data
        ///   (here in `marker.color`) or the bounds set in `marker.cmin` and `marker.cmax` Has an effect only
        ///   if in `marker.color`is set to a numerical array.
        ///   - cMin: Sets the lower bound of the color domain.
        ///   - cMax: Sets the upper bound of the color domain.
        ///   - cMiddle: Sets the mid-point of the color domain by scaling `marker.cmin` and/or `marker.cmax`
        ///   to be equidistant to this point.
        ///   - colorScale: Sets the colorscale.
        ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
        ///   true`) or the palette determined by `marker.colorscale`.
        ///   - reverseScale: Reverses the color mapping if true.
        ///   - showScale: Determines whether or not a colorbar is displayed for this trace.
        ///   - colorAxis: Sets a reference to a shared color axis.
        public init(symbol: Symbol? = nil, size: Data<Double>? = nil, sizeReference: Double? = nil,
                sizeMin: Double? = nil, sizeMode: Shared.SizeMode? = nil, opacity: Double? = nil, colorBar:
                Shared.ColorBar? = nil, line: Shared.MarkerLine? = nil, coloring: Coloring? = nil, cAuto: Bool?
                = nil, cMin: Double? = nil, cMax: Double? = nil, cMiddle: Double? = nil, colorScale: ColorScale?
                = nil, autoColorScale: Bool? = nil, reverseScale: Bool? = nil, showScale: Bool? = nil,
                colorAxis: Layout.ColorAxis = Layout.ColorAxis(uid: 1)) {
            self.symbol = symbol
            self.size = size
            self.sizeReference = sizeReference
            self.sizeMin = sizeMin
            self.sizeMode = sizeMode
            self.opacity = opacity
            self.colorBar = colorBar
            self.line = line
            self.coloring = coloring
            self.cAuto = cAuto
            self.cMin = cMin
            self.cMax = cMax
            self.cMiddle = cMiddle
            self.colorScale = colorScale
            self.autoColorScale = autoColorScale
            self.reverseScale = reverseScale
            self.showScale = showScale
            self.colorAxis = colorAxis
        }
        
    }

    /// - Note:
    ///   Used by `Surface.lightPosition`, `Isosurface.lightPosition`, `Volume.lightPosition`,
    ///   `Mesh3D.lightPosition`, `Cone.lightPosition`, `StreamTube.lightPosition`.
    public struct LightPosition: Encodable {
        /// Numeric vector, representing the X coordinate for each vertex.
        public var x: Double? = nil
    
        /// Numeric vector, representing the Y coordinate for each vertex.
        public var y: Double? = nil
    
        /// Numeric vector, representing the Z coordinate for each vertex.
        public var z: Double? = nil
    
        /// Creates `LightPosition` object with specified properties.
        /// 
        /// - Parameters:
        ///   - x: Numeric vector, representing the X coordinate for each vertex.
        ///   - y: Numeric vector, representing the Y coordinate for each vertex.
        ///   - z: Numeric vector, representing the Z coordinate for each vertex.
        public init(x: Double? = nil, y: Double? = nil, z: Double? = nil) {
            self.x = x
            self.y = y
            self.z = z
        }
        
    }

    /// - Note:
    ///   Used by `Isosurface.lighting`, `Volume.lighting`, `Mesh3D.lighting`, `Cone.lighting`,
    ///   `StreamTube.lighting`.
    public struct Lighting: Encodable {
        /// Epsilon for vertex normals calculation avoids math issues arising from degenerate geometry.
        public var vertexNormalsEpsilon: Double? = nil
    
        /// Epsilon for face normals calculation avoids math issues arising from degenerate geometry.
        public var faceNormalsEpsilon: Double? = nil
    
        /// Ambient light increases overall color visibility but can wash out the image.
        public var ambient: Double? = nil
    
        /// Represents the extent that incident rays are reflected in a range of angles.
        public var diffuse: Double? = nil
    
        /// Represents the level that incident rays are reflected in a single direction, causing shine.
        public var specular: Double? = nil
    
        /// Alters specular reflection; the rougher the surface, the wider and less contrasty the shine.
        public var roughness: Double? = nil
    
        /// Represents the reflectance as a dependency of the viewing angle; e.g.
        /// 
        /// paper is reflective when viewing it from the edge of the paper (almost 90 degrees), causing
        /// shine.
        public var fresnel: Double? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case vertexNormalsEpsilon = "vertexnormalsepsilon"
            case faceNormalsEpsilon = "facenormalsepsilon"
            case ambient
            case diffuse
            case specular
            case roughness
            case fresnel
        }
        
        /// Creates `Lighting` object with specified properties.
        /// 
        /// - Parameters:
        ///   - vertexNormalsEpsilon: Epsilon for vertex normals calculation avoids math issues arising from
        ///   degenerate geometry.
        ///   - faceNormalsEpsilon: Epsilon for face normals calculation avoids math issues arising from
        ///   degenerate geometry.
        ///   - ambient: Ambient light increases overall color visibility but can wash out the image.
        ///   - diffuse: Represents the extent that incident rays are reflected in a range of angles.
        ///   - specular: Represents the level that incident rays are reflected in a single direction, causing
        ///   shine.
        ///   - roughness: Alters specular reflection; the rougher the surface, the wider and less contrasty
        ///   the shine.
        ///   - fresnel: Represents the reflectance as a dependency of the viewing angle; e.g.
        public init(vertexNormalsEpsilon: Double? = nil, faceNormalsEpsilon: Double? = nil, ambient:
                Double? = nil, diffuse: Double? = nil, specular: Double? = nil, roughness: Double? = nil,
                fresnel: Double? = nil) {
            self.vertexNormalsEpsilon = vertexNormalsEpsilon
            self.faceNormalsEpsilon = faceNormalsEpsilon
            self.ambient = ambient
            self.diffuse = diffuse
            self.specular = specular
            self.roughness = roughness
            self.fresnel = fresnel
        }
        
    }

    /// - Note:
    ///   Used by `Isosurface.contour`, `Volume.contour`, `Mesh3D.contour`.
    public struct ContourHover: Encodable {
        /// Sets whether or not dynamic contours are shown on hover
        public var show: Bool? = nil
    
        /// Sets the color of the contour lines.
        public var color: Color? = nil
    
        /// Sets the width of the contour lines.
        public var width: Double? = nil
    
        /// Creates `ContourHover` object with specified properties.
        /// 
        /// - Parameters:
        ///   - show: Sets whether or not dynamic contours are shown on hover
        ///   - color: Sets the color of the contour lines.
        ///   - width: Sets the width of the contour lines.
        public init(show: Bool? = nil, color: Color? = nil, width: Double? = nil) {
            self.show = show
            self.color = color
            self.width = width
        }
        
    }

}