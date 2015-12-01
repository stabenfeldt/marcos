class PartList extends React.Component {
  render () {
      var list = this.props.items.map(function (element) {
          return <Part {...element} />
      });
    return(
        <div>
        {list}
        </div>
    );
  }
}
