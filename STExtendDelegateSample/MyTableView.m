//
//  MyTableView.m
//  STExtendDelegateSample
//
//  Created by EIMEI on 2013/02/02.
//
//  Copyright (c) 2012 stack3.net (http://stack3.net/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "MyTableView.h"

@implementation MyTableView {
    __weak id<MyTableViewDelegate> _myDelegate;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        
        UIButton *headerView = [UIButton buttonWithType:UIButtonTypeCustom];
        [headerView setTitle:@"Header View" forState:UIControlStateNormal];
        [headerView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        headerView.backgroundColor = [UIColor grayColor];
        headerView.frame = CGRectMake(0, 0, frame.size.width, 80);
        [headerView addTarget:self action:@selector(headerViewDidTap) forControlEvents:UIControlEventTouchUpInside];
        self.tableHeaderView = headerView;
    }
    return self;
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    if (delegate == self) {
        // Set delegate to UITableView(Superclass).
        [super setDelegate:delegate];
    } else {
        // set delegate to _myDelegate(Subclass delegate).
        _myDelegate = (id<MyTableViewDelegate>)delegate;
    }
}

- (void)headerViewDidTap
{
    if ([_myDelegate respondsToSelector:@selector(tableViewDidTapHeaderView:)]) {
        [_myDelegate tableViewDidTapHeaderView:self];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_myDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        // Forward UITableViewDelegate to MyTableViewDelegate
        [_myDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
