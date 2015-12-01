class Part extends React.Component {
  render () {
    return (
      <div className="col-sm-6 col-md-4">
        <div className="thumbnail">
          <img src={this.props.image} />
          <div className="caption">
            <div>Brand: {this.props.brand}</div>
            <div>Model: {this.props.model}</div>
            <div>Year: {this.props.year}</div>
            <div>Note: {this.props.note}</div>
          </div>
        </div>
      </div>
    );
  }
}

Part.propTypes = {
  brand: React.PropTypes.string,
  model: React.PropTypes.string,
  year: React.PropTypes.node,
  note: React.PropTypes.string
};
